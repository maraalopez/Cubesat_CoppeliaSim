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


%% --- JOYSTICK: intentar inicializar ---
joyAvailable = false;
try
    joy = vrjoystick(1);   % primer joystick
    joyAvailable = true;
    disp('Joystick detectado.');
    disp('  Joystick: botón 1 aumenta, botón 2 disminuye, botón 3 sale');
catch
    disp('No se detectó joystick, solo se usará teclado.');
end

%% --- Bucle principal ---
while ishandle(fig)
    
    % --- Lectura joystick ---
    if joyAvailable
        %buttons = readButtons(joy);  % vector de botones 0/1
        [axes, buttons, povs] = read(joy);

        
        if buttons(3)  % botón 3 (circulo) = salir
            disp('Saliendo...');
            break;
        end
        if buttons(1) %cuadrado
            v1Global = v1Global + 1;
        elseif buttons(2) %X
            v1Global = v1Global - 1;
        end
    end

    %Actualizamos el valor en CoppeliaSim
    sim.setFloatSignal('joint1', v1Global);
    sim.setFloatSignal('joint2', v2Global);
    sim.setFloatSignal('joint3', v3Global);

    speed_1 = sim.getJointVelocity(joint_1);
    speed_2 = sim.getJointVelocity(joint_2);
    speed_3 = sim.getJointVelocity(joint_3);
    

        disp(['Velocidad real 1: ' num2str(speed_1)]);
    
    pause(0.05);  % delay pequeño para no saturar CPU
end