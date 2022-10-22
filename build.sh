cd Content


function latex_build {
    pdflatex -interaction=nonstopmode '\newcommand{\studentCompleted}{'"$5 $6"'}\newcommand{\student}{'"$1 $2"'}\newcommand{\group}{'"$3"'}\input{main}'
    biber main 
    pdflatex -interaction=nonstopmode '\newcommand{\studentCompleted}{'"$5 $6"'}\newcommand{\student}{'"$1 $2"'}\newcommand{\group}{'"$3"'}\input{main}'
    pdflatex -interaction=nonstopmode '\newcommand{\studentCompleted}{'"$5 $6"'}\newcommand{\student}{'"$1 $2"'}\newcommand{\group}{'"$3"'}\input{main}'
    cp main.pdf $4.pdf
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
completed=(
    "Выполнил студент"
    "Выполнил студент"
    "Выполнила студентка"
    "Выполнила студентка"
    "Выполнил студент"
    "Выполнил студент"
    "Выполнил студент"
)


for ((i = 0; i < ${#names[@]}; i+= 1)) do
    latex_build ${names[$i]} ${groups[$i]} ${files[$i]} ${completed[$i]} 
done 

# ls /github/workspace
