figure(1)

subplot(2,1,1)
plot(out.phi(:,1),out.phi(:,2))
title('курс')
xlabel('Время, сек');
ylabel('\phi, градусы'); 

subplot(2, 1, 2)
plot(out.delta(:,1),out.delta(:,2))
title('Угол поворота руля')
xlabel('Время, сек');
ylabel('\delta, градусы'); 

subplot(2, 1, 1);
plot(phi0(:,1), phi0(:,2), out.phi (:,1), out.phi(:,2));
title('Курс');
xlabel('Время, сек');
ylabel('\phi, градусы');
legend('ПД-регулятор', 'ПИД-регулятор'); 

subplot(2, 1, 2);
plot(delta0(:,1), delta0(:,2), out.delta (:,1), out.delta(:,2));
title('Курс');
xlabel('Время, сек');
ylabel('\delta, градусы');
legend('ПД-регулятор', 'ПИД-регулятор'); 
