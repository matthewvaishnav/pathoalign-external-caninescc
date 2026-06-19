$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

pdflatex -interaction=nonstopmode -halt-on-error main.tex
pdflatex -interaction=nonstopmode -halt-on-error main.tex

Copy-Item main.pdf pathoalign-external-caninescc.pdf -Force
Write-Host "Built paper\pathoalign-external-caninescc.pdf"
