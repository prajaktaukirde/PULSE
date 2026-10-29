# PULSE - Packet Utility for Live Structure Exploration

**PULSE** is a real-time network traffic visualization engine imbued with a retro cyberpunk / CRT aesthetic (inspired by *Tron*, *Hackers*, and arcade interfaces). Watch network traffic flow live as animated neon particles traveling between dynamic host nodes.

![Preview](PREVIEW.gif)

---

## ⚡ Features

### Real-Time Network Visualization
- **Dynamic Node Scaling**: Host entities scale dynamically according to traffic volume (*Agar.io* style).
- **Animated Packet Flow**: Packets travel between nodes as glowing particles, color-coded by protocol (TCP, UDP, ICMP, etc.).
- **Multiple Rendering Engines**: High-performance Canvas renderer (handling thousands of objects at 60+ FPS) and lightweight Minimal DOM renderer.
- **Interactive Viewport**: Pan, zoom, and click/hover on nodes to inspect real-time IP metadata and packet statistics.

### Traffic Analysis & Capture Modes
- **Simulated Traffic**: Built-in synthetic traffic generator for rapid testing and demonstrations (enabled by default).
- **Real-Time Packet Capture**: Live capture from host network interfaces via `gopacket` / Npcap / libpcap.
- **PCAP Replay**: Replay pre-recorded `.pcap` capture archives at customizable speeds (1x, 2x, etc.).
- **Zeek TCP Sensor**: Stream and visualize live Zeek `conn.log` NDJSON feeds over TCP.

### Retro Cyberpunk Aesthetics
- Dark mode terminal UI with CRT scanlines, neon glows, and phosphorescent trails.
- Built-in command console (`u@pulse$#`) and diagnostics dashboard.
- Live FPS, bandwidth, and protocol distribution monitors.

---

## 🚀 Live Cloud Deployment

PULSE comes ready with multi-stage containerization for seamless 1-click cloud deployment.

### Option 1: Deploy with Render (Free Tier)
1. Fork or push this repository to GitHub: [`prajaktaukirde/PULSE`](https://github.com/prajaktaukirde/PULSE)
2. Go to [Render.com](https://render.com) and click **New +** → **Web Service**.
3. Connect your `PULSE` GitHub repository.
4. Render will automatically detect the root `Dockerfile` and `render.yaml`.
5. Set:
   - **Environment**: `Docker`
   - **Plan**: `Free`
6. Click **Deploy Web Service**! Your visualizer will be live with full WebSocket support.

### Option 2: Deploy with Docker Locally or on a VPS
```bash
# Build the production Docker image
docker build -t pulse-visualizer .

# Run the container (maps to port 8080)
docker run -d -p 8080:8080 --name pulse pulse-visualizer
```
Then visit `http://localhost:8080` in your browser.

### Option 3: Deploy with Railway / Fly.io
- **Railway**: Simply create a new project, select **Deploy from GitHub repo**, choose `PULSE`, and Railway will automatically build and run the Dockerfile.
- **Fly.io**: Run `fly launch` in the project root.

---

## 💻 Local Development Setup

### Prerequisites
- **Node.js**: v18+ (tested with v20/v24)
- **Go**: 1.21+ (tested with Go 1.25/1.27)
- **Npcap** (Windows) or **libpcap-dev** (Linux/macOS) *optional, only needed for live packet capture*

### 1. Backend Setup
```bash
cd backend
go run ./cmd/main.go
```
*The backend starts on `http://localhost:8080` in simulated mode.*

### 2. Frontend Setup
```bash
cd frontend
npm install
npm run dev
```
*The frontend starts on `http://localhost:5173/` and proxies WebSocket and API requests to `:8080`.*

---

## 🛠 Tech Stack

- **Backend**: Go 1.21+, Gorilla WebSocket, Gopacket, iplib
- **Frontend**: React 18, TypeScript, Vite, Zustand, TailwindCSS, PixiJS / HTML5 Canvas
- **Deployment**: Docker (Multi-stage Node + Go build on Alpine Linux), Render Blueprint

---

## 📜 License

MIT License. See [LICENSE](LICENSE) for details.
