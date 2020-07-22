function [ coeff,score,rate ] = myPCA( X,dim )
% ���ɷַ���
    % X:ԭʼ���ݣ��б�ʾ�������б�ʾ��������
    % dim:��ά֮���ά��
    % coeff:ͶӰ����(�任����)
    % score:ԭʼ����X�����ɷֿռ�ı�ʾ
    % rate:��ͬdim�µĹ����ʣ����ڸ���dim��ȷ��

%����Э����
Cov=cov(X); 

% %ȥ��ֵ��
% % mean_=X-ones(size(X,1),1)*mean(X);
% %����Э����
% % Cov=mean_'*out_mean_/(size(X,1)-1);

%����ֵ�ֽ�
[eigen_vector,eigen_value]=eig(Cov);
[latent,idx]=sort(diag(eigen_value),'descend');

eigVec=eigen_vector(:,idx);

coeff=eigVec(:,1:dim);
score=X*coeff;

%���㹱����
rate=cumsum(latent)/sum(latent);

end

