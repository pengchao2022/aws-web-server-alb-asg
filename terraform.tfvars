aws_region = "us-east-1"
vpc_id     = "vpc-0d82f8694f7cb5f47"
private_subnet_ids = [
  "subnet-0af7016ab5b6e7bc3",
  "subnet-044baf4797af84e0b",
  "subnet-00a7a052c439cedc8",
]
public_subnet_ids = [
  "subnet-0fedc60ddc263ae55",
  "subnet-03df41962310ce119",
  "subnet-0a2c0045bd9d59b01",
]
instance_type        = "t3.micro"
min_size             = 1
max_size             = 3
desired_capacity     = 1
cpu_utilization_high = 70
cpu_utilization_low  = 30
nginx_port           = 80
alb_port             = 80
health_check_path    = "/"
ssh_public_key       = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDNdFVOs6Ni+FwWWUdnZsuA4YoJTv9b3fcUXL4WhlIqx1BQnWB07Kc07XjvDNnxveZtHgTD6PuP7XZF75ZIOSgN3UXCCsXWT9CnAe5cgvvY2+f/B1Ishihj+3bviVll9xSCc5fOFHBgl96FYp/K8QCAW+EnOdSh4ZDbNygmdZfMEFULsFVg9JWfD846HQygq4cKhsRRgz/FiwqyJVgEtQ099ByORKF5qI7MS3WIMDFx1/6icVedldeNatEraxEAdKvBpXqeHXJRH4aFWINQTMEV5JczvGZInjmaKsFImIVeazF76ViLm9H23dHZxDF4LyXF/bg99Hm7PysEQU7eRcFx+enJhDKF/YbC3kkB5Z6cohDomyWW5qkDRIcYkeV71YZ9cVgQUVkNvDC5Is6mLMpqjv4dnsXT1eqScRFrSk7bxjTjBpFOm1axFvBelMMytkKCl+/MZ5b5Vpz3kCStVHHqXh0dPdrjKkV9TWMudJ88uPpuGS6eLbOnUJD0qjwP8oc= ubuntu@ip-172-20-1-100"