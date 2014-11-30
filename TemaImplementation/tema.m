function [err_max] = tema (n, met)

  h =  1.0 / (n + 1.0);
  x = zeros(1, n +  2);
  ExactSolution = zeros(1, n +  2); % Solutia exacta calc dupa form obtinuta la mana
  y = zeros(1, n +  2);
  e = zeros(1, n +  2);

  x(1) = 6;
  y(1) = 14; 

  for i = 2 : n + 2   % initializam x si facem tranzlatia in intervalul pe care il vrem
      x(i) = x(1) + i * h;
  end
  
  for i = 1 : n + 2 %calculul solutiei exacte 
      ExactSolution(i) = 0.25 * (2 * x(i) + 45 * exp(1)^(12 - 2 * x(i)) - 1); % replace solutia exacta here!
  end

  for i = 1 : n + 1 % calculez y in functie de metoda
      switch met
          case '1'
            y(i + 1) = y(i) + h * func(x(i), y(i));
          case '2'
            y(i + 1) = y(i) + h * func(x(i), y(i) + h * func(x(i), y(i)));
          case '3'
            y(i + 1) = y(i) + h/2*(func(x(i), y(i)) + func(x(i+1), y(i) + h * func(x(i), y(i))));
          case '4'
            y(i + 1) = y(i) + h * func(x(i) + h/2, y(i) + h/2 * func(x(i), y(i)));
          case '5'
              m1 = h * func(x(i), y(i));
              m2 = h * func(x(i) + h/2, y(i) + m1/2);
              m3 = h * func(x(i) + h/2, y(i) + m2/2);
              m4 = h * func(x(i) + h, y(i) + m3);
              y(i + 1) = y(i) + 1/6 * (m1 + 2 * m2 + 2 * m3 + m4);
      end
  end

  for i = 1 : n + 2
      e(i) = abs(ExactSolution(i) - y(i));
  end
  err_max = max(e);
  
  f = figure();
  % rep grafice ale celor doua solutii.
  subplot(1,2,2);
  hold on;
  xlabel('x');
  ylabel('y');
  title(['n=', int2str(n),' Err=', num2str(err_max)]);
  plot(x, ExactSolution, 'b');
  plot(x, y, 'g');
  legend('Exact', 'Aproximat');
 
  %tabel erori
  Columns = {'e','e/h','e/h2','e/h3','e/h4','e/h5'};
  errArray = [e; e ./ h; e ./ h^2; e ./ h^3; e ./ h^3;e ./ h^5];
  uitable(f,'Data', errArray', 'Position', [1 1 600 550], 'ColumnWidth',{90}, 'ColumnName', Columns);  
  hold off;
end
