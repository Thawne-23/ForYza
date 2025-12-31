# Create directories
$directories = @(
    "images",
    "audio"
)

foreach ($dir in $directories) {
    $path = Join-Path -Path $PSScriptRoot -ChildPath $dir
    if (-not (Test-Path -Path $path)) {
        New-Item -ItemType Directory -Path $path -Force
        Write-Host "Created directory: $path"
    } else {
        Write-Host "Directory already exists: $path"
    }
}

# Download sample images
$imageUrls = @(
    "https://images.unsplash.com/photo-1518199266791-5375a83190b7?w=800&q=80",
    "https://images.unsplash.com/photo-1516589178581-6cd7833ae3b2?w=800&q=80",
    "https://images.unsplash.com/photo-1518621736915-f3b1c41bfd00?w=800&q=80",
    "https://images.unsplash.com/photo-1518621736915-3aec910d5e7e?w=800&q=80",
    "https://images.unsplash.com/photo-1518621736915-f3b1c41bfd00?w=800&q=80",
    "https://images.unsplash.com/photo-1518621736915-3aec910d5e7e?w=800&q=80"
)

for ($i = 0; $i -lt $imageUrls.Count; $i++) {
    $imagePath = Join-Path -Path $PSScriptRoot -ChildPath "images\pic$($i + 1).jpg"
    if (-not (Test-Path -Path $imagePath)) {
        Invoke-WebRequest -Uri $imageUrls[$i] -OutFile $imagePath
        Write-Host "Downloaded image: $imagePath"
    } else {
        Write-Host "Image already exists: $imagePath"
    }
}

# Download sample music
$musicUrl = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
$musicPath = Join-Path -Path $PSScriptRoot -ChildPath "audio\romantic_music.mp3"
if (-not (Test-Path -Path $musicPath)) {
    Invoke-WebRequest -Uri $musicUrl -OutFile $musicPath
    Write-Host "Downloaded music: $musicPath"
} else {
    Write-Host "Music file already exists: $musicPath"
}

Write-Host "\nSetup complete!"
Write-Host "Your files are ready in: $PSScriptRoot"
