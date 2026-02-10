clear all;

%% CONEXIÓN DE COPPELLIASIM Y MATLAB
%Conectamos con CoppeliaSim
client = RemoteAPIClient();
sim = client.require('sim');

%Empezamos la simulación en stepping mode
%sim.setStepping(true);
sim.startSimulation();

%Como primera prueba, vamos a fijar la velocidad de la articulación del eje
%x distinta de 0
joint_1 = sim.getObject('/joint1');
joint_2 = sim.getObject('/joint2');
joint_3 = sim.getObject('/joint3');
%sim.step();

% nos aseguramos de que tienen fuerza suficiente para alcanzar la velocidad objetivo
sim.setJointForce(joint_1, 500);

%Creamos la variable que contiene la velocidad de joint1
v1 = sim.getJointVelocity(joint_1);

%Creamos la variable que contiene la velocidad de joint1
v2 = sim.getJointVelocity(joint_2);

%Creamos la variable que contiene la velocidad de joint1
v3 = sim.getJointVelocity(joint_3);



%% --- TECLADO: configurar figura para capturar teclas ---
fig = figure('Name','Control variable','NumberTitle','off', ...
    'MenuBar','none', 'ToolBar','none', 'KeyPressFcn',@keyPress);

disp('Controles:');
disp('  Teclado: ↑ aumenta, ↓ disminuye, ESC sale');

% Variables globales para usar dentro del callback
global v1Global;
global v2Global;
global v3Global;
global finishg;
finishg = 0;
v1Global = v1;
v2Global = v2;
v3Global = v3;



%% --- Bucle principal ---
while ishandle(fig)
      
    %speed_1 = v1Global;  % leer valor actualizado por callback

    %Actualizamos el valor en CoppeliaSim
    sim.setFloatSignal('joint1', v1Global);
    sim.setFloatSignal('joint2', v2Global);
    sim.setFloatSignal('joint3', v3Global);
    %sim.step();

    speed_1 = sim.getJointVelocity(joint_1);
    speed_2 = sim.getJointVelocity(joint_2);
    speed_3 = sim.getJointVelocity(joint_3);
    
    
    % Mostrar valor actual
    disp(['Valor actual: ' num2str(speed_1)]);

    if finishg == 1 || ~ishandle(fig)
        break;
    end
    
    pause(0.01);  % delay pequeño para no saturar CPU
end

sim.stopSimulation();


%% --- CALLBACK DEL TECLADO ---
function keyPress(~, event)
    global v1Global;
    global v2Global;
    global v3Global;
    global finishg;
    switch event.Key
        case 'uparrow' 
            v1Global = v1Global + 0.2;
        case 'downarrow'
            v1Global = v1Global - 0.2;
        case 'leftarrow'
            v2Global = v2Global + 0.2;
        case 'rightarrow'
            v2Global = v2Global - 0.2;
        case 's'
            v3Global = v3Global + 0.2;
        case 'a'
            v3Global = v3Global - 0.2;
        case 'escape'
            finishg = 1;
            close(gcf);  % cierra la figura y termina el bucle
    end
end
