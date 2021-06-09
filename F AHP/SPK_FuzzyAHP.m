%suatu petani didaerah tertentu ingin mengetahui potensi cabai terbaik yang
%akan ditanamnya pada periode mendatang berdasarkan data pengalamannya
%dalam menanam 4 jenis cabai dengan jumlah bibit dan lokasi yang sama
%berdasarkan INTENSITAS PUPUK(kg), HASIL PANEN(kg), dan TERJUAL(kg) dengan
%data sebagai berikut :

namaCabai = {'Cabai Rawit' 'Cabai Hijau' 'Cabai Merah' 'Paprika'};
data = [ 4 50 40
         2 30 25
         3 30 28
         1 10 9 ];
     
maksPupuk = 4;
maksBeratPanen = 70;
maksBeratJual  = 70;

data(:,1) = data(:,1) / maksPupuk;
data(:,2) = data(:,2) / maksBeratPanen;
data(:,3) = data(:,3) / maksBeratJual;

relasiAntarKriteria = [ 1 4 2
                        0 1 2
                        0 0 1 ];
                    
TFN = {[-100/3 0     100/3]     [3/100  0     -3/100]
       [0      100/3 200/3]     [3/200  3/100 0     ]
       [100/3  200/3 300/3]     [3/300  3/200 3/100 ]
       [200/3  300/3 400/3]     [3/400  3/300 3/200 ]};
   
[RasioKonsistensi] = HitungKonsistensiAHP(relasiAntarKriteria)

if RasioKonsistensi < 0.10
    % Metode Fuzzy AHP
    [bobotAntarKriteria, relasiAntarKriteria] = FuzzyAHP(relasiAntarKriteria, TFN);    

    % Hitung nilai skor akhir 
    ahp = data * bobotAntarKriteria';
    
    disp('Hasil Perhitungan dengan metode Fuzzy AHP')
    disp('Jenis Cabai  ,Hasil Akhir, Kesimpulan')

for i = 1:size(ahp, 1)
        if ahp(i) < 0.6
            status = 'Kurang';
        elseif ahp(i) < 0.7
            status = 'Cukup';
        elseif ahp(i) < 0.8
            status = 'Baik';
        else
            status = 'Sangat Baik';
        end
        
        disp([char(namaCabai(i)), blanks(13 - cellfun('length',namaCabai(i))), ', ', ... 
             num2str(ahp(i)), blanks(10 - length(num2str(ahp(i)))), ', ', ...
             char(status)])
    end
end


