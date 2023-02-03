#include <iostream>
#include <string>
using namespace std;

string* binary(char ch)
{
    string *result = new string();
    for(int i=0;i<8;i++)
    {
        *result=to_string(ch&1)+*result;
        ch>>=1;
    }
    return result;
}

int main()
{
    char help[100]={'[','a','i',']',' ','1',' ',':',' ','3',' ','[','p','l','a','y','e','r',']','\n','\0'};
    int i=51,j=0;
    while(help[j]!='\0')
    {
        cout<<"            8'd" <<i<<":"<<endl;
        cout<<"            begin"<<endl;
        cout<<"                tx_ready <= 0;"<<endl;
        cout<<"                counter <= 32'd9416;"<<endl;
        cout<<"                state <= 8'd"<<i+1<<";"<<endl;
        cout<<"            end"<<endl;
        i++;
        cout<<"            8'd" <<i<<":"<<endl;
        cout<<"            begin"<<endl;
        cout<<"                tx_ready <= 1;"<<endl;
        cout<<"                counter <= 32'd1000;"<<endl;
        cout<<"                tx_data <= 8'b"<<(*binary(help[j]))<<";"<<endl;
        cout<<"                state <= 8'd"<<i+1<<";"<<endl;
        cout<<"            end"<<endl;
        j++;
        i++;
    }

}