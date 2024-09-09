if [ ! -f "./data/quiz.db" ]; then

    if [ -f "./src/quiz.sql" ]; then
        sqlite3 data/quiz.db < src/quiz.sql
    else
        exit 1
    fi

    if [ -f "./src/users.csv" ]; then
        python src/adduser.py
    else
        echo "Arquivo users.csv não encontrado!"
    fi
else
    echo "Banco de dados encontrado."
fi

# Iniciar o servidor Flask
flask run
