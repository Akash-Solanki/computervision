function norm=normalized(matrix)
         [m_row, m_col]=size(matrix);
         mean=sum(sum(matrix))/(m_row*m_col);
         norm = (matrix-mean)/(m_row*m_col);
end
