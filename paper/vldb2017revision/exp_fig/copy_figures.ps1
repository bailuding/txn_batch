# Copy pdfs from the snapshot to the experiment figure folder.
# Copy basic
$snapshot="0_pdf_snapshot"
$basicDir="basic"


# Copy linespoint figures
$basicLpDir = (Get-ChildItem -path $snapshot -filter ($basicDir + "*lp*")).FullName
Write-Host $basicLpDir

$metric = "tps", "latency"
foreach ($m in $metric) {
    $src = (Get-ChildItem -path $basicLpDir -filter ("*" + $m + ".pdf")).FullName
    $dst = Join-Path -Path $basicDir -ChildPath ($m + ".pdf")
    Copy-Item $src $dst
    Write-Host "Copy from $src to $dst"
}