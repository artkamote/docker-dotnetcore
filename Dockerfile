
FROM mcr.microsoft.com/dotnet/sdk:5.0

# this is for dotNet core version 5.0 only

# Add build-essential and tools
RUN echo "Acquire::Check-Valid-Until \"false\";\nAcquire::Check-Date \"false\";" | cat > /etc/apt/apt.conf.d/10no--check-valid-until

RUN apt-get update && apt-get install -y --no-install-recommends build-essential \
python3-pip python-pip \
ca-certificates groff less \
bash make jq curl wget g++ \
zip git openssh-server && \
pip --no-cache-dir install awscli && update-ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/apps