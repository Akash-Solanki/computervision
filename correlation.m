function conv=convolution_2d(m,k,pad)
        m_size=size(m);
        m_row=m_size(1);
        m_col=m_size(2);
        k_size=size(k);
        k_r=k_size(1);
        k_c=k_size(2);
        
        if pad==0
           conv=zeros(m_row-k_r+1,m_col-k_c+1);
           for x=1:m_row-k_r+1
               for y=1:m_col-k_c+1
                   i=normalized(m(x:x+k_r-1,y:y+k_c-1));
                   conv(x,y)=sum(sum(normalized(k).*i));
               end
           end
        else 
            conv=zeros(m_row,m_col);
            mn=padarray(m,[(k_r-1)/2,(k_c-1)/2]);
            for x=1:m_row
                for y=1:m_col
                    i=normalized(mn(x:x+k_r-1,y:y+k_c-1));
                    conv(x,y)=sum(sum(normalized(k).*i));
                end
            end
        end
end

            