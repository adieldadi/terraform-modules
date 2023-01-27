data "archive_file" "newposts_lambda_package" {  
  type = "zip"  
  source_file = "${path.module}/scripts/newposts.py" 
  output_path = "newposts.zip"
}

data "archive_file" "text2audio_lambda_package" {  
  type = "zip"  
  source_file = "${path.module}/scripts/text2audio.py" 
  output_path = "text2audio.zip"
}

data "archive_file" "getpostsinfo_lambda_package" {  
  type = "zip"  
  source_file = "${path.module}/scripts/getpostsinfo.py" 
  output_path = "getpostsinfo.zip"
}
