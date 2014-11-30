
function [] = tema (n)
  h =  1.0 / (n + 1.0);
  x = zeros(1, n +  2);
  y = zeros(1, n +  2);
  e = zeros(1, n +  2);
  se = zeros(1, n +  2);

  for i = 1 : n + 2
      x(i) = i * h;
  end

  for i = 1 : n + 2
      se(i) = 2 * exp(1)^x(i) - x(i) - 1;
  end

  y(1) = 1.0;

  for i = 1 : n + 1
      y(i + 1) = y(i) + h * (x(i) + y(i));
  end

  for i = 1 : n + 2
      e(i) = se(i) - y(i);
  end
  eroare_totala = sum(e);
  eroare_maxima = max(e);
  hold on;
  xlabel('x');
  ylabel('y');
  title(['n=', int2str(n), ' Eroare totala = ', num2str(eroare_totala), ' Eroare maxima = ', num2str(eroare_maxima)]);

  plot(x,se,'r');
  plot(x,y,'b');
  legend('Sol exacta', 'Sol aprox');
  hold off;


endfunction
