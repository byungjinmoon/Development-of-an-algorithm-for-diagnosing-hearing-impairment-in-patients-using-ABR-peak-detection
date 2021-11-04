function [I_index,III_index,V_index,I_amp,III_amp,V_amp]=peak_detect(x)

ABR_sample=x;% x is the ABR signal(75dB, 65dB...)
L=5;
c_1=1;
c_2=1;
d=1;
for n=1:length(ABR_sample)-2*L
    %using dual windowing
    max_first=max(ABR_sample(n:n+L));
    max_second=max(ABR_sample(n+L:n+2*L));
    max_mid_value=ABR_sample(n+L);
    min_first=min(ABR_sample(n:n+L));
    min_second=min(ABR_sample(n+L:n+2*L));
    min_mid_value=ABR_sample(n+L);
    if (max_first == max_second) && (max_first==max_mid_value) &&(max_second==max_mid_value)
       %peak 위치와 크기
       peak_index(c_1)=n+L;
       peak_amp(c_1)=max_first;
       c_1=c_1+1;
       %peak와 크기값 모두 저장
       amp(d)=max_first;
       amp_index(d)=n+L;
       d=d+1;
    elseif (min_first == min_second) && (min_first==min_mid_value) &&(min_second==min_mid_value)
       %valley 위치와 크기
       val_index(c_2)=n+L;
       val_amp(c_2)=min_first;
       c_2=c_2+1;
       %valley 크기값 모두 저장
       amp(d)=min_first;
       amp_index(d)=n+L;
       d=d+1;
    end
end
for n=1:length(amp)-1
    dif_1(n)=amp(n)-amp(n+1);
end
for n=2:length(amp)
    dif_2(n)=amp(n)-amp(n-1);
end
% peak candidate들 찾기

[can_amp_1,can_index_1]=maxk(dif_1,4);
[can_amp_2,can_index_2]=maxk(dif_2,4);
candidate_index=[amp_index(can_index_1) amp_index(can_index_2)];
candidate_amp=ABR_sample(candidate_index);
ABR_candidate_index=candidate_index;
ABR_candidate_amp=candidate_amp;

ABR_candidate_index=sort(ABR_candidate_index,2);
fs=25.278219;% 1ms-->25sample
ABR_candidate_time=ABR_candidate_index/fs;


r=find(ABR_candidate_time>6);
ref_list=ABR_candidate_time(1,r);
ref_time=min(ref_list);
V_time=ref_time;

%index로 변환
V_index=abs(V_time*fs);
V_amp=x(V_index);

r=find(ABR_candidate_time>3);
ref_list=ABR_candidate_time(1,r);
ref_time=min(ref_list);
III_time=ref_time;

%index로 변환
III_index=abs(III_time*fs);
III_amp=x(III_index);

r=find(ABR_candidate_time>1);
ref_list=ABR_candidate_time(1,r);
ref_time=min(ref_list);
I_time=ref_time;

%index로 변환
I_index=abs(I_time*fs);
I_amp=x(I_index);
%   V_index,III_index,I_index are  I, III, V-wave peak positions.(75dB,
%   65dB...)


