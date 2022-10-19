cd /Content
pdflatex main.tex -interaction=nonstopmode
biber main 
pdflatex main.tex -interaction=nonstopmode
pdflatex main.tex -interaction=nonstopmode
cp /Content/main.pdf /github/workspace/main.pdf

ls /github/workspace
