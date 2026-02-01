import pygame
import sys

from coppeliasim_zmqremoteapi_client import RemoteAPIClient

def move(axis, value):
    if axis == 0:
        joint = "joint1_speed"
    elif axis == 1:
        joint = "joint2_speed"
    elif axis == 2:
        joint = "joint3_speed"
    else:
        return
       
    #current = sim.getJointTargetVelocity(joint)
    #sim.setJointTargetVelocity(joint, current+value )
    sim.setFloatSignal(joint, value / 5)   
    #print(f"Señal: {joint}:{value}")    

# Inicializar el joystick
pygame.joystick.init()

# Comprobar si hay al menos un joystick conectado
if pygame.joystick.get_count() == 0:
    print("No se detectó ningún joystick.")
    pygame.quit()
    sys.exit()

# Obtener el primer joystick
joystick = pygame.joystick.Joystick(0)
joystick.init()
print(f"Joystick detectado: {joystick.get_name()}")

# Crear una ventana simple
pantalla = pygame.display.set_mode((400, 300))
pygame.display.set_caption("Eventos del Joystick")

# CoppeliaSim handlers and start simulation
client = RemoteAPIClient()
sim = client.require('sim')

#joint1Handle = sim.getObject("/joint1")
#joint2Handle = sim.getObject("/joint2")
#joint3Handle = sim.getObject("/joint3")

#sim.setStepping(True)
sim.startSimulation()

#sim.setJointTargetVelocity(joint1Handle, 1 )
#sim.setJointTargetVelocity(joint2Handle, 0.5 )
#sim.setJointTargetVelocity(joint3Handle, 1.5 )

#sim.setFloatSignal("joint1", 0.5 )   
#sim.setFloatSignal("joint2", 1.5 )   
#sim.setFloatSignal("joint3", 1.0 )   

# Bucle principal
running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

        # Movimiento de los ejes
        elif event.type == pygame.JOYAXISMOTION:
            print(f"Eje {event.axis} movido a {event.value:.2f}")
            move( event.axis, event.value )
            #current = sim.getJointTargetVelocity(joint1H print(f"Botón {event.button} presionado")andle)
            #sim.setJointTargetVelocity(joint1Handle, current+event.value )

        # Botones presionados
        elif event.type == pygame.JOYBUTTONDOWN:
            print(f"Botón {event.button} presionado")
            if event.button == 0:
                sim.setFloatSignal("joint1_rand_speed", 0.5 )   
                sim.setFloatSignal("joint2_rand_speed", 1.5 )   
                sim.setFloatSignal("joint3_rand_speed", 1.0 )   
            elif event.button == 1:
                sim.setFloatSignal("joint1_clear_speed", 0.0 )   
                sim.setFloatSignal("joint2_clear_speed", 0.0 )   
                sim.setFloatSignal("joint3_clear_speed", 0.0 )   
            elif event.button == 2:
                sim.setFloatSignal("joint1_hide", 1.0 )
                sim.setFloatSignal("joint2_hide", 1.0 )
                sim.setFloatSignal("joint3_hide", 1.0 )
            elif event.button == 3:
                sim.setFloatSignal("joint1_show", 1.0)
                sim.setFloatSignal("joint2_show", 1.0)
                sim.setFloatSignal("joint3_show", 1.0)

        elif event.type == pygame.JOYBUTTONUP:
            print(f"Botón {event.button} liberado")

        # Movimiento del hat (cruceta)
        elif event.type == pygame.JOYHATMOTION:
            print(f"Hat movido a {event.value}")

    pantalla.fill((0, 0, 0))
    pygame.display.flip()

# Finalizar
sim.stopSimulation()
joystick.quit()
pygame.quit()    
