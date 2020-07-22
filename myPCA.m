function [ coeff,score,rate ] = myPCA( X,dim )
% 主成分分析
    % X:原始数据，行表示样本，列表示样本属性
    % dim:降维之后的维数
    % coeff:投影矩阵(变换矩阵)
    % score:原始数据X在主成分空间的表示
    % rate:不同dim下的贡献率，用于辅助dim的确定

%计算协方差
Cov=cov(X); 

% %去均值化
% % mean_=X-ones(size(X,1),1)*mean(X);
% %计算协方差
% % Cov=mean_'*out_mean_/(size(X,1)-1);

%特征值分解
[eigen_vector,eigen_value]=eig(Cov);
[latent,idx]=sort(diag(eigen_value),'descend');

eigVec=eigen_vector(:,idx);

coeff=eigVec(:,1:dim);
score=X*coeff;

%计算贡献率
rate=cumsum(latent)/sum(latent);

end

