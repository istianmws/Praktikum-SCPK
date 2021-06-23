x=[40000,4,50,40;35000,2,30,25;90000,3,30,28;100000,1,10,9];
k=[0,0,1,1];
w=[0.25,0.2,0.3,0.2];

disp ('nilai input x=')
disp (x)
disp ('bobot yang diberikan w=')
disp (w)
disp ('atribut tiap kriteria k=')
disp (k)

%tahapan 1. normalisasi matriks
[m n]=size (x); % matriks mxn dengan ukuran sebanyak variabel x(input)
R=zeros (m,n); % membuat matriks R, matriks kosong
Y=zeros (m,n); % membuat matriks Y, matriks kosong
for j=1:n,
    if k(j)==1, %statement untuk kriterian dengan atribut benefit
        R(:,j)=x(:,j)./max(x(:,j));
    else %statement kriteria atribut cost
        R(:,j)=min(x(:,j))./x(:,j);
    end;
end;

disp ('matriks yang sudah ternormalisasi R=')
disp (R)

%tahapan kedua, proses perangkingan
for i=1:m,
    V(i) = sum(w.*R(i,:))
end;

