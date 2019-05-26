function [ X,Y,R] = im2minperpoly( B,cellsize )
if cellsize <= 1 
   error('CELLSIZE must be an integer > 1.');  
end 
[B,num]=bwlable(B);
if num>1
    error('Input image cannot contain more than one region.')
end
R=cellcomplex(B,cellsize);
[X,Y]=mppvertices(R,cellsize);
end

function R-cellcomplex(B,cellsize)
B = imfill(B, 'holes'); 
B = bwperim(B);                
[M, N] = size(B);
K = nextpow2(max(M, N)/cellsize); 
K = (2^K)*cellsize; 
M = K - M; 
N = K - N; 
B = padarray(B, [M N], 'post');
Q = qtdecomp(B, 0, cellsize);  
[vals, r, c] = qtgetblk(B, Q, cellsize);
I = find(sum(sum(vals(:, :, :)) >= 1)); 
x = r(I); 
y = c(I); 
for k = 1:length(I) 
   B(x(k):x(k) + cellsize-1, y(k):y(k) + cellsize-1) = 1; 
end 
     
BF = imfill(B, 'holes'); 
B = BF & (~B); 
R=B(1:M,1:N);
end

function [X,Y]=mppvertices(R,cellsize)
B=boundaries(R,4,'noholes');   
B=B{1};  
B=B(1:end - 1,:);
x=B(:,1);
y=B(:,2);
L=vertexlist(x,y,cellsize);
NV=size(L,1);
count=1;
k=1;
X(1)=L(1,1);
Y(1)=L(1,2);
cMPPV=[L(1,1),L(1,2)];
cV=cMPPV;
classV=L(1,3);
cWH=cMPPV;
cBL=cMPPV;
while true
    count=count+1;
    if count>NV+1
        break;
    end
    if count==NV+1
        cV=[L(1,1),L(1,2)];
        classV=L(1,3);
    else
        cV=[L(count,1),L(count,2)];
        classV=L(count,3);
    end
    [I,newMPPV,W,B]=mppVtest(cMPPV,cV,classV,cWH,cBL);
    if I==1 
        cMPPV=newMPPV;
        K=find(L(:,1)==newMPPV(:,1)&(L:,2)==newMPPV(:2));
        count=K;
        cWH=newMPPV;
        cBL=newMPPV;
        K=K+1;
        X(k)=newMPPV(1,1);
        Y(k)=newMPPV(1,2);
    else
        cWH=W;
        cBL=B;
    end
end
X=X(:);
Y=Y(:);
end

function L=vertexlist(x,y,cellsize)
cx=find(x==min(x));
cy=find(y==min(y(cy)));
x1=x(cx(1));
y1=y(cy(1));
I=find(x==x1&y==y1);
x=circshift(x,[-(I-1),0]);
y=circshift(y,[-(I-1),0]);
J=1;
K=length(x);
xnew(1)=x(1);
ynew(1)=y(1);
x(k+1)=x(1);
y(k+1)=y(1);
for K=2:K
    s=vsign([x(k-1),y(k-1)],[x(k),y(k)],[x(k+1),y(k+1)]);
    if s~=0
        J=J+1;
        xnew(J)=x(k);
        ynew(J)=y(k);
    end
end
x=xnew;
y=ynew;
[dir,x,y]=boundarydir(x,y,'ccw');
K=length(x);
L(:,:,:)=[x(:)y(:)zeros(K,1)];
C=zeros(K,1);
s=vsign([x(K) y(K)],[x(1) y(1)],[x(2) y(2)]);
if s>0
    C(1)=1;
elseif s<0
    C(1)=-1;
    [rx ry]=vreplacement([x(K) y(K)],[x(1) y(1)],[x(2) y(2)],cellsize);
    L(1,1)=rx;
    L(1,2)=ry;
else
    C(1)=0;
end
s=vsign([x(K-1) y(K-1)],[x(K) y(K)],[x(1) y(1)]);
if s>0
   C(K)=1;
elseif s<0
    C(K)=-1;
    [rx ry]=vreplacement([x(K-1) y(K-1)],[x(K) y(K)],[x(1) y(1)],cellsize);
     L(K,1)=rx;
     L(K,2)=ry;
else
    C(K)=0;
end
for k=2:k-1
s=vsign([x(k-1) y(k-1)],[x(k) y(k)],[x(k+1) y(k+1)]);
if s>0
    C(k)=1;
elseif s<0
    C(k)=-1;
    [rx ry]=vreplacement([x(k-1) y(k-1)],[x(k) y(k)],[x(k+1) y(k-1)],cellsize);
     L(k,1)=rx;
     L(k,2)=ry;
else
    C(k)=0;
end    
L(;,3)=C(:);
end

    function s=vsign(v1,v2,v3)
        A=[v1(1) v1(2) 1;v2(1) v2(2) 1;v3(1) v3(2) 1;];
        s=det(A);
    end

    function [rx ry]=vreplacement(v1,v,v2,cellsize)
        if v(1)>v1(1)&&v(2)==v1(2)&&v(1)==v2(1)&&v(2)>v2(2)
            rx=v(1)-cellsize;
            ry=v(2)-cellsize;
        elseif v(1)==v1(1)&&v(2)>v1(2)&&v(1)<v2(1)&&v(2)==v2(2)
            rx=v(1)+cellsize;
            ry=v(2)-cellsize;
        elseif v(1)<v1(1)&&v(2)==v1(2)&&v(1)==v2(1)&&v(2)<v2(2)
            rx=v(1)+cellsize;
            ry=v(2)+cellsize;
        elseif v(1)==v1(1)&&v(2)<v1(2)&&v(1)>v2(1)&&v(2)==v2(2)
            rx=v(1)-cellsize;
            ry=v(2)+cellsize;
        else
            error('Vertex configuration is not valid')
        end
    end

    function [I,newMPPV,W,B]=mppVtest(cMPPV,cv,classV,cWH,cBL)
        I=0;
        newMPPV=[0,0];
        W=cWH;
        B=cBL;
        sW=vsign(cMPPV,cWH,cV);
        sB=vsign(cMPPV,cBL,cV);
        if sW>0
            I=1;
            newMPPV=cWH;
            W=newMPPV;
            B=newMPPV;
        elseif sB<0
            I=1;
            newMPPV=cBL;
            W=newMPPV;
            B=newMPPV;
        elseif (sW<=0)&&(sB>=0)
            if classcV==1
                W=cV;
            else
                B=cV;
            end
        end
    end
           
