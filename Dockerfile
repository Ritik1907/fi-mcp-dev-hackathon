# Use official Go image as base
FROM golang:1.21

# Set working directory inside container
WORKDIR /app

# Copy Go modules and download deps
COPY go.mod go.sum ./
RUN go mod download

# Copy source code
COPY . .

# Build the Go binary
RUN go build -o fi-mcp-server

# Set environment variable for port
ENV FI_MCP_PORT=8080

# Expose the correct port
EXPOSE 8080

# Run the binary
CMD ["./fi-mcp-server"]
