require_relative 'isbn.rb'
load './local_env.rb' if File.exist?('./local_env.rb')


def readbucket()
bucketreg = 'us-east-1'
bucket = 'isbn-file'
arr = []
s3 = Aws::S3::Client.new(region: bucketreg, access_key_id: ENV['S3_KEY'], secret_access_key: ENV['S3_SECRET'])
response = s3.get_object(bucket: bucket, key: ENV['S3_File'])
CSV.parse(response.body) do |v|
    stripped = v[1].to_s.tr("a-w", "").tr("y-z", "").gsub("-", "").gsub(" ", "").gsub("\""," ").gsub("\]", "").gsub("\[", "")
         if stripped.length == 10
            arr.push([stripped + " is " + isbn10(stripped)])
        else
            arr.push([stripped + " is " + isbn13(stripped)])
         end
    end
    arr
end


def writebucket(file)
bucketreg = 'us-east-1'
bucket = ENV['S3_BUCKET']
s3 = Aws::S3::Client.new(region: bucketreg, access_key_id: ENV['S3_KEY'], secret_access_key: ENV['S3_SECRET'])
response = s3.get_object(bucket: bucket, key: ENV['S3_File'])
s3 = Aws::S3::Resource.new(region: bucketreg, access_key_id: ENV['S3_KEY'], secret_access_key: ENV['S3_SECRET'])
CSV.read(file, "r") do |row|
CSV.open(response.body, "wb") do |csv|
    csv << row
        end
    end
    obj = s3.bucket(ENV['S3_BUCKET']).object(ENV['S3_File'])
    obj.upload_file(file)
end