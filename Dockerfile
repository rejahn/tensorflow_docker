FROM nvidia/cuda:11.8.0-devel-ubuntu22.04

# Install necessary packages
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -y python3-pip python3-dev git vim && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN python3 -m pip install --upgrade pip

# Install TensorFlow GPU
RUN python3 -m pip install tensorflow[and-cuda]==2.14

# Install other Python packages
RUN python3 -m pip install jupyter notebook numpy pandas matplotlib scikit-learn pydot

# Set environment variables for GPU use
ENV LD_LIBRARY_PATH /usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility

CMD ["tail", "-f", "/dev/null"]