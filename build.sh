cd Content


function latex_build {
    pdflatex -interaction=nonstopmode '\newcommand{\student}{'"$1 $2"'}\newcommand{\group}{'"$3"'}\input{main}'
    biber main 
    pdflatex -interaction=nonstopmode '\newcommand{\student}{'"$1 $2"'}\newcommand{\group}{'"$3"'}\input{main}'
    pdflatex -interaction=nonstopmode '\newcommand{\student}{'"$1 $2"'}\newcommand{\group}{'"$3"'}\input{main}'
    cp main.pdf /github/workspace/$4.pdf
}

declare -a cases
names=(
    "Макогон А.А."
    "Хамитов Т.Н."
    "Жукова Д.А."
    "Петренко К.Е."
    "Ершов И.П."
    "Брусенин Д.А."
    "Test Test"
)
groups=(
    "206"
    "206"
    "205"
    "206"
    "203"
    "205"
    "404"
)
files=(
    "Makogon"
    "Khamitov"
    "Zhukova"
    "Petrenko"
    "Ershov"
    "Brusenin"
    "article"
)


for ((i = 0; i < ${#names[@]}; i+= 1)) do
    latex_build ${names[$i]} ${groups[$i]} ${files[$i]} 
done 

# ls /github/workspace
