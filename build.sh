cd Content


function latex_build {
    pdflatex -interaction=nonstopmode '\newcommand{\student}{'"$1"'}\newcommand{\group}{'"$2 $3"'}\input{main}'
    biber main 
    pdflatex -interaction=nonstopmode '\newcommand{\student}{'"$1"'}\newcommand{\group}{'"$2 $3"'}\input{main}'
    pdflatex -interaction=nonstopmode '\newcommand{\student}{'"$1"'}\newcommand{\group}{'"$2 $3"'}\input{main}'
    cp /Content/main.pdf /github/workspace/$4.pdf
}

declare -a cases
names=(
    "Макогон А.А."
    "Хамитов Т.Н."
    "Жукова Д.А."
    "Петренко К.Е."
    "Ершов И.П."
    "Брусенин Д.А."
    "Test"
)
groups=(
    "206"
    "206"
    "208"
    "206"
    "208"
    "208"
    "404"
)
files=(
    "Makogon"
    "Khamitov"
    "Zhukova"
    "Petrenko"
    "Erhsov"
    "Brusenin"
    "article"
)


for ((i = 0; i < ${#names[@]}; i+= 1)) do
    latex_build ${names[$i]} ${groups[$i]} ${files[$i]} 
done 

# ls /github/workspace
