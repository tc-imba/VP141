#include <iostream>
#include <fstream>
#include <math.h>
#include <string>
#include <sstream>

const double U_T = 0.0001;
const double U_T_R = 0.00004;
const double T_95[] = {4.30, 4.30, 4.30, 4.30, 3.18, 2.78, 2.57, 2.45, 2.36, 2.31, 2.26};
const double U_L = 0.02;
const double U_M = 0.1;

using namespace std;
ofstream out("out.txt");

class Data
{
public:
    double t[8];
    double u_t[8];
    double beta[4];
    double u_beta[4];
    double beta_m;
    double u_beta_m;

    Data(double (&)[8]);
    string formTable();
};

class Result
{
public:
    Data *dec, *acc;
    double I_dec, I_acc;

    Result(Data *, Data *);
};


Data::Data(double (&data_t)[8])
{
    for (int i = 0; i < 8; i++)
    {
        t[i] = data_t[i];
        cout << t[i] << "\t";
        u_t[i] = U_T + t[i] * U_T_R;
    }
    cout << endl;
    double u_beta_max = beta_m = 0;
    for (int i = 0; i < 4; i++)
    {
        int m = i, n = i + 4;
        double km = m + 1, kn = n + 1;
        double div = (t[m] * t[n] * (t[n] - t[m]));
        beta[i] = 2 * M_PI * (kn * t[m] - km * t[n]) / div;
        u_beta[i] = 2 * M_PI *
                    sqrt(pow((kn * t[m] * t[m] * t[n] + (km * t[n] * t[n]) * (t[n] - 2 * t[m])) / div / div * u_t[m],
                            2) +
                         pow((km * t[n] * t[n] * t[m] + (kn * t[m] * t[m]) * (t[m] - 2 * t[n])) / div / div * u_t[n],
                                 2));
        beta_m += beta[i] / 4;
        u_beta_max = max(u_beta_max, u_beta[i]);
        cout << beta[i] << "\t" << u_beta[i] << "\t\t";
    }
    cout << endl;
    double beta_s = 0;
    for (int i = 0; i < 4; i++)
    {
        beta_s += pow(beta[i] - beta_m, 2);
    }
    beta_s = sqrt(beta_s / 12);
    double u_beta_ma = beta_s * T_95[4], u_beta_mb = u_beta_max;
    u_beta_m = sqrt(pow(u_beta_ma, 2) + pow(u_beta_mb, 2));
    cout << beta_m << "\t" << beta_s << "\t";
    cout << u_beta_ma << "\t" << u_beta_mb << "\t\t" << u_beta_m;
    cout << endl << endl;
}

Result::Result(Data *dec, Data *acc)
{
    this->dec = dec;
    this->acc = acc;
}


int main()
{
    double data_t[8] = {};
    Result *result[5];
    ifstream in("data.txt");
    for (int i = 0; i < 5; i++)
    {
        Data *data[2];
        for (int j = 0; j < 2; j++)
        {
            for (int k = 0; k < 8; k++)
            {
                in >> data_t[k];
            }
            data[j] = new Data(data_t);
        }
        result[i] = new Result(data[0], data[1]);
    }
    return 0;
}