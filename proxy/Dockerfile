FROM golang:1.22


# Install required dependencies for building GUI apps with fyne + GLFW
RUN apt-get update && apt-get install -y \
    gcc \
    pkg-config \
    libgl1-mesa-dev \
    libx11-dev \
    libxrandr-dev \
    libxinerama-dev \
    libxcursor-dev \
    libxi-dev \
    libxxf86vm-dev \
    libxext-dev \
    libgtk-3-dev \
    xorg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o proxy .

EXPOSE 8080
CMD ["./proxy"]
