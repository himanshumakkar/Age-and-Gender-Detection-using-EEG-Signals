i=0;
savefile1='Alpha/temp.txt';
savefile2='Beta/temp.txt';
savefile3='Theta/temp.txt';
savefile4='Gamma/temp.txt';
savefile5='Delta/temp.txt';

myfile1 = fopen(savefile1 ,'wt');     
myfile2 = fopen(savefile2 ,'wt');    
myfile3 = fopen(savefile3 ,'wt');     
myfile4 = fopen(savefile4 ,'wt');    
myfile5 = fopen(savefile5 ,'wt'); 
    

while i < 90
    if(i<10)
        nam='priya0';
    
    else
        nam='priya';
    end

file=strcat(nam,num2str(i),'.txt');
S = load(file);
%%fileId=fopen('Vector_Govind.txt','wt');
g=double(14);
b=double(14);
a=double(14);
t=double(14);
d=double(14);
aa=double(15);
for k=4:17
                waveletFunction = 'db8';
                [C,L] = wavedec(S(:,k),8,waveletFunction);
                %% Calculation The Coificients Vectors
                cD1 = detcoef(C,L,1);                   %NOISY
                cD2 = detcoef(C,L,2);                   %NOISY
                cD3 = detcoef(C,L,3);                   %NOISY
                cD4 = detcoef(C,L,4);                   %NOISY
                cD5 = detcoef(C,L,5);                   %GAMA
                cD6 = detcoef(C,L,6);                   %BETA
                cD7 = detcoef(C,L,7);                   %ALPHA
                cD8 = detcoef(C,L,8);                   %THETA
                cA8 = appcoef(C,L,waveletFunction,8);   %DELTA
                %%%% Calculation the Details Vectors
                D1 = wrcoef('d',C,L,waveletFunction,1); %NOISY
                D2 = wrcoef('d',C,L,waveletFunction,2); %NOISY
                D3 = wrcoef('d',C,L,waveletFunction,3); %NOISY
                D4 = wrcoef('d',C,L,waveletFunction,4); %NOISY
                Gamma = wrcoef('d',C,L,waveletFunction,5); %GAMMA
                Beta  = wrcoef('d',C,L,waveletFunction,6); %BETA
                Alpha = wrcoef('d',C,L,waveletFunction,7); %ALPHA
                Theta = wrcoef('d',C,L,waveletFunction,8); %THETA
                Delta = wrcoef('a',C,L,waveletFunction,8); %DELTA
                
alpha=mean(Alpha);
beta=mean(Beta);
gamma=mean(Gamma);
theta=mean(Theta);
delta=mean(Delta);
ind=k-3;
g(:,ind)=gamma;
b(:,ind)=beta;
a(:,ind)=alpha;
aa(:,ind)=alpha;
t(:,ind)=theta;
d(:,ind)=delta;
                
end

fprintf(myfile1, '%g ',a);
fprintf(myfile1, '\n');
fprintf(myfile2, '%g ',b);
fprintf(myfile2, '\n');
fprintf(myfile3, '%g ',t);
fprintf(myfile3, '\n');
fprintf(myfile4, '%g ',g);
fprintf(myfile4, '\n');
fprintf(myfile5, '%g ',d);
fprintf(myfile5, '\n');

i=i+1;
end
fclose(myfile1);
fclose(myfile2);
fclose(myfile3);
fclose(myfile4);
fclose(myfile5);

%%aa(:,15)=0.0;
