$destDir = "d:\projects\custom2048\assets"
$sourceDir = "C:\Users\rbai\.gemini\antigravity\brain\8dc8d71c-b764-491e-8e79-14b8c6fed4bc"

# Create destination directory
if (-not (Test-Path -Path $destDir)) {
    New-Item -ItemType Directory -Path $destDir -Force
}

# Define mapping
$mapping = @{
    "uploaded_image_0_1766739440371.png" = "tile-2.png"
    "uploaded_image_1_1766739440371.png" = "tile-4.png"
    "uploaded_image_2_1766739440371.png" = "tile-8.png"
    "uploaded_image_3_1766739440371.png" = "tile-16.png"
    "uploaded_image_4_1766739440371.png" = "tile-32.png"
    "uploaded_image_0_1766739638594.png" = "tile-64.png"
    "uploaded_image_1_1766739638594.png" = "tile-128.png"
    "uploaded_image_2_1766739638594.png" = "tile-256.png"
    "uploaded_image_3_1766739638594.png" = "tile-512.png"
    "uploaded_image_4_1766739638594.png" = "tile-1024.png"
    "uploaded_image_1766739708846.png"  = "tile-2048.png"
}

# Process files
foreach ($key in $mapping.Keys) {
    $srcPath = Join-Path $sourceDir $key
    $destPath = Join-Path $destDir $mapping[$key]
    
    if (Test-Path $srcPath) {
        Write-Host "Moving $key to $mapping[$key]"
        Copy-Item -Path $srcPath -Destination $destPath -Force
    } else {
        Write-Warning "Source file not found: $srcPath"
    }
}

Write-Host "Asset setup complete."
