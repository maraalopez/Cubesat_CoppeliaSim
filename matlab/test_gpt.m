clear all;

%% CONEXIÓN CON COPPELIASIM
client = RemoteAPIClient();
sim = client.require('sim');

%sim.setStepping(true);
sim.startSimulation();

joint_1 = sim.getObject('/joint1');
joint_2 = sim.getObject('/joint2');

% Fuerza suficiente
sim.setJointForce(joint_1, 500);

%% VARIABLES GLOBALES
global v1Global finishg
v1Global = 0;
finishg = 0;

%% FIGURA PARA TECLADO
fig = figure('Name','Control Joint 1', ...
    'KeyPressFcn',@keyPress);

disp('↑ aumenta velocidad');
disp('↓ disminuye velocidad');
disp('ESC salir');

%% BUCLE PRINCIPAL
while finishg == 0 && ishandle(fig)

    % Enviar señal de incremento/decremento
    sim.setFloatSignal('joint1', v1Global);

    % Avanzar simulación UN paso
    %sim.step();

    % Leer velocidad real
    v_real = sim.getJointTargetVelocity(joint_1);
    disp(['Velocidad real: ' num2str(v_real)]);

    drawnow;      % <-- CLAVE para el teclado

end

sim.stopSimulation();

%% CALLBACK TECLADO
function keyPress(~, event)
    global v1Global finishg
    switch event.Key
        case 'uparrow'
            v1Global = v1Global + 0.2;
        case 'downarrow'
            v1Global = v1Global -0.2;
        case 'escape'
            finishg = 1;
            close(gcf);
    end
end