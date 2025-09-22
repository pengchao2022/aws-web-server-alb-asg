#!/bin/bash
# Update system and install Docker
apt-get update
apt-get install -y docker.io

# Start and enable Docker service
systemctl start docker
systemctl enable docker

# Setup SSH for ubuntu user
mkdir -p /home/ubuntu/.ssh
echo "${ssh_public_key}" >> /home/ubuntu/.ssh/authorized_keys
chown -R ubuntu:ubuntu /home/ubuntu/.ssh
chmod 700 /home/ubuntu/.ssh
chmod 600 /home/ubuntu/.ssh/authorized_keys

# Run Nginx container
docker run -d \
  --name nginx \
  -p ${nginx_port}:80 \
  --restart unless-stopped \
  nginx:alpine

# Optional: Install cloudwatch agent for better monitoring
apt-get install -y unzip
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
dpkg -i -E ./amazon-cloudwatch-agent.deb

# Create simple health check script
cat << 'EOF' > /home/ubuntu/health_check.sh
#!/bin/bash
# Simple health check script
echo "Instance Health Check:"
echo "======================"
echo "Docker status:"
systemctl is-active docker
echo "Nginx container status:"
docker inspect --format='{{.State.Status}}' nginx
echo "CPU usage:"
top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'
echo "Memory usage:"
free -h | grep Mem | awk '{print $3 " / " $2}'
EOF

chmod +x /home/ubuntu/health_check.sh
chown ubuntu:ubuntu /home/ubuntu/health_check.sh

echo "User data script completed successfully"