# DC4CU

**DC4CU** es un conjunto de *scripts y herramientas* que facilitan la creación de un Controlador de Dominio de acorde a lo establecido en las Empresas Cubanas. La versión para Windows Server tiene como visión usar Windows Server Core (2k12R2/2k16/2k19) lo cual permite un mayor aprovechamiento de los recursos y fomenta el crecimiento del SysAdmin en tareas de administración. La versión de Linux en cambio se basa en Windows Server 2008 R2 puesto que es el máximo nivel funcional que ofrece Samba4 como Controlador de Dominio.


# Instalación

Una vez clonado el repositorio de **DC4CU** usando el comando 
`
git clone https://github.com/danny920825/dc4cu
` tendremos tanto la carpeta de Windows como la de Linux (Pendiente a implementar). 



## Windows Server

Para el caso de Windows Server, se debe ejecutar el script [DC4CU_Win.ps1](https://github.com/danny920825/DC4CU/blob/main/windows/DC4CU_Win.ps1 "DC4CU_Win.ps1") el cual mostrará un menu con las opciones para comenzar el proceso:

### 1. Crear Archivo de Variables
El archivo dc4cu.ini se copiará a una carpeta con el mismo nombre en la unidad C:
Este archivo contiene las variables que se utilizarán en el proceso de instalación:
### dc4cu.ini
```
User=Administrator
DomainName=pruebas.net
NetBiosName=prueba
SafeModeAdministratorPassword=P4$$W0RD
subnet=192.168.35.0/24
Forwarders=192.168.35.1
```

**User: Usuario Administrativo local (Administrator o Administrador)**
**DomainName: Nombre del dominio. Compuesto por nombre.tld**
**SafeModeAdministratorPassword: Password por si es necesario entrar en modo a seguro al Controlador de Dominio**
**Subnet: Rango de IP de la LAN con el CIDR**
**Forwarder (No Implementado): IP del DNS que resuelve las peticiones que no pertenezcan al Dominio**




### Instalar Controlador de Dominio

Esta opción carga las variables del paso anterior y ejecuta cada uno de los comandos de *PowerShell* necesarios para crear un Controlador de Dominio funcional, asi como instalar los modulos de PowerShell para el trabajo con el Active Directory y el Servidor DNS. Al reiniciar deberá presionar la tecla **Y** para reiniciar el servidor y aplicar todos los cambios. 
*nota:* Este paso tambien instala el servidor DNS y la Zona Directa del mismo.

### Establecer zona inversa en el DNS

La zona inverza del Servidor DNS será instalada en base al rango de IP/CIDR establecido en el archivo de variables.
*nota: Está previsto implementar mas funcionalidades para incluir zonas personalizadas con otros rangos de IP en futuras versiones. Para casos de DMZ y otras segmentaciones*

### Extras

Los scripts extras son herramientas que si bien no son necesarias en la creación pueden ayudar a la gestión. Actualmente se cuenta con 4:
1. Instalación del cliente Git para Windows desde Internet
2. Instalación de OpenSSH para Windows desde Internet
3. Agregar ambas herramientas al path de windows para poder ejecutar ambas desde cualquier lugar del sistema.
4. Establecer Powershell como Shell por defecto al iniciar Windows

Pendientes a Implementar:
1. Opciones variadas de accesos en el Firewall de Windows (Permitir ping, RDP, etc)
2. Script para provisionamiento automático de Usuarios llenando los campos necesarios para integrarse con proyectos como [MailAD](https://github.com/stdevPavelmc/mailad/) 
3. Script para importar usuarios desde un CSV basados en una plantilla

## Linux

**_No implementado aun_**