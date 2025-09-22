#!/bin/bash
# Update and install Docker
apt-get update
apt-get install -y docker.io

# Start Docker service
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

# Simple CPU stress test script (for testing auto scaling)
cat << 'EOF' > /home/ubuntu/stress_test.sh
#!/bin/bash
# This script is for testing purposes only
stress_cpu() {
    echo "Starting CPU stress test..."
    # Install stress-ng if not present
    if ! command -v stress-ng &> /dev/null; then
        apt-get update
        apt-get install -y stress-ng
    fi
    stress-ng --cpu 2 --timeout 300s &
    echo "CPU stress test started for 5 minutes"
}

stop_stress() {
    echo "Stopping CPU stress test..."
    pkill stress-ng
    echo "CPU stress test stopped"
}

case "$1" in
    start)
        stress_cpu
        ;;
    stop)
        stop_stress
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
        ;;
esac
EOF

chmod +x /home/ubuntu/stress_test.sh
chown ubuntu:ubuntu /home/ubuntu/stress_test.sh

# Install cloudwatch agent for better monitoring
apt-get install -y unzip
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
dpkg -i -E ./amazon-cloudwatch-agent.deb