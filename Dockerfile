# Stage 1: Build dependencies and install requirements

FROM public.ecr.aws/lambda/python:3.11-x86_64 AS builder

# Set the working directory within the container
WORKDIR /app

# Copy your requirements.txt file into the container
COPY requirements.txt .

# Install Python packages to a temporary directory
RUN pip install --no-cache-dir -r requirements.txt -t /tmp/python_dependencies

# Stage 2: Create a minimal runtime image
FROM public.ecr.aws/lambda/python:3.11-x86_64

# Set the working directory within the container
WORKDIR /app

# Copy the installed Python requirements from the builder stage
COPY --from=builder /tmp/python_dependencies /app/python

# Specify the command to run when the container is started (no command needed)
CMD [""]
