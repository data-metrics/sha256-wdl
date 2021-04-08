version 1.0

task sha256 {
  input {
    File? input_file
  }

  command {
    sha256sum ${default="/data/sha256.default.test.txt" input_file} > sha256.output
  }

 output {
    File output_file = "sha256.output"
 }

 runtime {
   docker: "quay.io/dailydreaming/sha256:stable-slim"
   cpu: 1
   memory: "128 MB"
 }
}

workflow generate_sha256 {
 input {
   File? input_file
 }
 call sha256 { input: input_file=input_file }
}
