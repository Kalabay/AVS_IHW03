#include <stdio.h>

double GetInput() { // считывние числа
    double x;
    scanf("%lf", &x);
    return x;
}

double Fact(int n) { // поиск факториала
    double fact = 1;
    for (int i = 1; i <= n; ++i) {
        fact *= i; // увеличение факториала
    }
    return fact;
}

void Arcsin(double x) { // для вычисления arcsin
    double arcsin = 0; // начальное значение
    int n = 0; // номер итерации
    double four = 1; // степень 4
    double xNow = x; // x в степени 2n + 1
    double add = 0; // добавка
    double POS_INF = 1.0 / 0.0; // inf
    double NEG_INF = -1.0 / 0.0; // -inf
    while (add != POS_INF && add != NEG_INF && xNow != 0) { // пока точность позволяет
        arcsin += add; // обновляем итоговое значение
        add = Fact(2 * n) * xNow / four / Fact(n) / Fact(n) / (2 * n + 1);
        xNow *= x * x; // x^(2n+1) -> x^(2(n+1)+1)
        four *= 4; // 4^n -> 4^(n+1)
        n++; // итерация + 1
    }
    printf("%lf", arcsin); // вывод ответа
    printf("\n");
}

int main(int argc, char** argv) {
    double x = GetInput(); // считывание
    if (x < -1 || x > 1) { // проверка
        printf("Incorrect\n");
    } else {
        Arcsin(x); // запуск ряда
    }
    return 0;
}
