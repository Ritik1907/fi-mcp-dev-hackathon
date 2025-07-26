# Use the official Go image
FROM golang:1.23

WORKDIR /app

# Copy code
COPY . .

# Install dependencies
RUN go mod tidy

# Expose port
ENV FI_MCP_PORT=8080

# Build app
RUN go build -o main .

# Run app
CMD ["./main"]
