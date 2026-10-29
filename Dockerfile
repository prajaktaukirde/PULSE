# Multi-stage Dockerfile for PULSE Network Visualizer

# Stage 1: Build the React Frontend
FROM node:20-alpine AS frontend-builder
WORKDIR /app/frontend
COPY frontend/package*.json ./
RUN npm install
COPY frontend/ ./
RUN npm run build

# Stage 2: Build the Go Backend
FROM golang:1.22-alpine AS backend-builder
RUN apk add --no-cache gcc musl-dev libpcap-dev
WORKDIR /app/backend
COPY backend/go.mod backend/go.sum ./
RUN go mod download
COPY backend/ ./
RUN CGO_ENABLED=1 GOOS=linux go build -o /app/pulse-server ./cmd/main.go

# Stage 3: Runtime Container
FROM alpine:3.19
RUN apk --no-cache add ca-certificates libpcap
WORKDIR /app
COPY --from=backend-builder /app/pulse-server /app/pulse-server
COPY --from=frontend-builder /app/frontend/dist /app/public

ENV PORT=8080
EXPOSE 8080

CMD ["/app/pulse-server"]
