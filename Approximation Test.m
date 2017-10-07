%% Siddharth Rajan
%% ENGR 103 Take Home Quiz
%% Section S2
%% Task 1

disp('Task 1');

p = [1, -6, 9, -4];
x = -1:0.01:5;

f = polyval(p,x);

plot(x,f);
title('Function f(x)');
xlabel('x');
ylabel('y');

r = roots(p);
disp('The roots of the equation are');
disp(r);
disp('There is a double root at x = 1. The two roots are x = 1 + 0i and x = 1 - 0i.');

%% Task 2

disp('Task 2');

gofx = @(x) (-1/9) * (x^3 - (6 * x^2) - 4);

err = 2e-4;
g = 3;
i = 1;

g(i + 1) = gofx(g(i));

while abs(g(i + 1) - g(i)) > err
    i = i + 1;
    g(i + 1) = gofx(g(i));
end

disp('Estimating the first root...');
disp(g');
disp('The most approximate value of this root is');
disp(g(end));

err = 2e-10;
g2 = 0;
i = 1;

g2(i + 1) = gofx(g2(i));

while abs(g2(i + 1) - g2(i)) > err
    i = i + 1;
    g2(i + 1) = gofx(g2(i));
end

disp('Estimating the next two roots...');
disp('The most approximate value of these roots are');
disp(g2(end));
disp('There is a double root at x = 1. The two roots are x = 1 + 0i and x = 1 - 0i.');

Ggraph = [-1/9, 6/9, 0, 4/9];
x = -1:0.01:5;

f2 = polyval(Ggraph,x);

plot(x,f2);
title('Function g(x)');
xlabel('x');
ylabel('y');

%% Task 3

disp('Task 3');

gofx = @(x) (-1/9) * (x^3 - (6 * x^2) - 4);

err = 2e-4;
g = 3.5;
i = 1;

g(i + 1) = gofx(g(i));

while abs(g(i + 1) - g(i)) > err
    for a = 1.1:0.1:1.9
        i = i + 1;
        g(i + 1) = gofx(g(i));
        g(i + 1) = g(i) + a * (g(i + 1) - g(i));
    end
end

disp('Estimating the first root...');
disp(g');
disp('The most approximate value of this root with an acceleration factor is');
disp(g(end));

err = 2e-10;
g2 = 0;
i = 1;

g2(i + 1) = gofx(g2(i));

while abs(g2(i + 1) - g2(i)) > err
    for a = 1.1:0.1:1.9
        i = i + 1;
        g2(i + 1) = gofx(g2(i));
        g2(i + 1) = g2(i) + a * (g2(i + 1) - g2(i));
    end
end

disp('Estimating the next two roots...');
disp('The most approximate value of these roots with an acceleration factor are');
disp(g2(end));
disp('There is a double root at x = 1. The two roots are x = 1 + 0i and x = 1 - 0i.');

%% Task 4

disp('Task 4');

f = @(x) x^3 - (6 * x^2) + (9 * x) - 4;
fpr = @(x) (3 * x^2) - (12 * x) + 9;

err = 2e-4;
g = 5;
i = 1;

g(i + 1) = g(i) - f(g(i))/fpr(g(i));

while abs(g(i + 1) - g(i)) > err
    i = i + 1;
    g(i + 1) = g(i) - f(g(i))/fpr(g(i));
end

disp('Estimating the first root...');
disp(g');
disp('The most approximate value of this root is');
disp(g(end));

err = 2e-5;
i = 1;
g2 = 2;

g2(i + 1) = g2(i) - f(g2(i))/fpr(g2(i));

while abs(g2(i + 1) - g2(i)) > err
    i = i + 1;
    g2(i + 1) = g2(i) - f(g2(i))/fpr(g2(i));
end


disp('Estimating the next two roots...');
disp(g2');
disp('The most approximate value of these roots are');
disp(g2(end));
disp('There is a double root at x = 1. The two roots are x = 1 + 0i and x = 1 - 0i.');

