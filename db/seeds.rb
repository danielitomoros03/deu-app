# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Iniciando carga de datos semilla..."

# Crear usuario admin
User.create!(email: "danielito.moros03@gmail.com", password: "123123");
if User.where(email: "danielito.moros03@gmail.com").exists?
  puts "Usuario admin creado con éxito."
  else
  puts "Error al crear el usuario admin."
end

# DEFINIR LAS PÁGINAS QUE NECESITAMOS

required_pages = [
  #HOME
  {
    name: "DEU - Espacios Universitarios",
    group: "inicio",
    subgroup: "view1",
    short_description: "Descubre cómo acceder y hacer uso de nuestras instalaciones para actividades académicas, culturales y recreativas, fomentando un entorno de aprendizaje e integración.",
    large_description:""
  },
  {
    name: "Estructura Organizativa", 
    group: "inicio",
    subgroup: "view2",
    short_description: "Conoce la organización y funcionamiento de nuestra institución, diseñada para garantizar una gestión eficiente y una mejor experiencia académica y administrativa.",
    large_description:""
  },
  {
    name: "certificaciones y Avales",
    group: "inicio", 
    subgroup: "view3",
    short_description: "Obtén reconocimientos oficiales que validan tu formación y experiencia, respaldados por nuestra institución y aliados estratégicos.",
    large_description:""
  },

#PROGRAMAS1 PROGRAMAS REGIONALES

  {
  name: "Programas Regionales 🚀",
  group: "programa2",
  subgroup: "description",
  short_description:"",
  large_description: "Los Programas Regionales fortalecen la presencia de la UCV en distintas comunidades del país, articulando soluciones a necesidades locales a través de la educación, la investigación y la vinculación con la sociedad. Su propósito es impulsar el desarrollo social, cultural y tecnológico mediante la formación académica, el apoyo a la innovación y la prestación de servicios en diversas áreas.
  \n\nMISIÓN\nPromover la participación activa de la UCV en el desarrollo regional, coordinando programas que respondan a las necesidades de las comunidades en educación, salud, infraestructura y otras áreas clave. A través de la vinculación con distintos sectores, buscamos mejorar la calidad de vida y fomentar el progreso sostenible.
  \n\nVISIÓN\nSer un modelo de referencia en la gestión de programas universitarios para el desarrollo local, consolidando a la UCV como un actor clave en la transformación social y la generación de conocimiento al servicio de las comunidades del país."
  },
  {
    name:"objetivos",
    group: "programa2",
    subgroup: "objectives",
    short_description:"",
    large_description: "Identificar las necesidades de desarrollo social y económico de las comunidades locales y regionales.\n
 Diseñar y ejecutar programas dentro de un marco de acción estratégico para la universidad, emanado desde la Dirección de Extensión Universitaria.\n
 Fortalecer el trabajo y la vinculación con las diversas comunidades locales y regionales, pertenecientes a los diferentes sectores."
  },
  {
    name:"funciones",
    group: "programa2",
    subgroup: "functions",
    short_description:"",
    large_description: "Realizar estudios y diagnósticos para identificar las necesidades específicas de las comunidades en las que se implementarán los programas.\n
 Diseñar y ejecutar programas y proyectos que respondan a las necesidades identificadas, en el marco de las áreas de acción establecidas.\n
 Gestionar los recursos humanos, financieros y materiales necesarios para la ejecución de los programas.\n
 Monitorear y evaluar el impacto de los programas en las comunidades, con el fin de realizar los ajustes necesarios para mejorar su efectividad.\n
 Fortalecer la vinculación con las comunidades a través de la comunicación permanente y la participación activa en la gestión de los programas.\n
 Los Programas Regionales deben difundir los resultados de sus investigaciones y evaluaciones.\n
 Esto se puede hacer a través de publicaciones, conferencias y talleres.\n
 Los Programas Regionales deben fortalecer las redes de trabajo con otras instituciones que trabajan con las comunidades."
  },

  {
    name:"contacto",
    group: "programa2",
    subgroup: "contact",
    short_description:"",
    large_description: "Coordinador: JUAN ALBERTO TINEO MALAVÉ.\n
 Tlf: (0412) 091-6710.\n
 Correo: coordinacion.ucvnuevaesparta@gmail.com"
  },
#PROGRAMA2
  {
    name:"Proyecto, Productos y Servicios 🚀",
    group: "programa3",
    subgroup: "description",
    short_description:"",
    large_description: "El Departamento de Proyectos, Productos y Servicios, adscrito a la División de Proyectos y Programas, gestiona y promueve la oferta interdisciplinaria de la UCV en materia de investigación, innovación y desarrollo. Su labor facilita la conexión entre la universidad y los sectores productivos, impulsando la generación de valor a partir del conocimiento académico y su aplicación en el ámbito económico y social.
    \n\nMISIÓN\nRecopilar, gestionar y conectar la oferta de proyectos, productos y servicios innovadores de la UCV con las necesidades del sector productivo, promoviendo la transferencia de conocimiento y fortaleciendo la relación entre la universidad y la sociedad.
    \n\nVISIÓN\nSer un puente estratégico entre la UCV y los sectores productivos, consolidando a la universidad como un referente en innovación, desarrollo sostenible y generación de soluciones aplicadas que contribuyan al progreso económico y social del país."
  },

  {
    name:"objetivos",
    group: "programa3",
    subgroup: "objectives",
    short_description:"",
    large_description: "Identificar oportunidades de vinculación entre la universidad y las comunidades, los sectores público y privado, y las organizaciones de la sociedad civil, coordinando con las Facultades el levantamiento de información sobre proyectos, productos y servicios universitarios.\n 
 Brindar apoyo técnico y administrativo a los equipos responsables de la ejecución de los proyectos universitarios.\n
 Divulgar los resultados de los proyectos universitarios a través de diversos canales de comunicación."
  },

  {
  name:"funciones",
  group: "programa3",
  subgroup: "functions",
  short_description:"",
  large_description: "Identificar, en trabajo conjunto a las facultades, las oportunidades de colaboración entre la Universidad y las comunidades, los sectores público y privado, y las organizaciones de la sociedad civil.\n
 Evaluar las propuestas de proyectos universitarios, considerando su relevancia social, impacto potencial y viabilidad técnica y financiera.\n
 Seleccionar los proyectos universitarios que se alineen con los objetivos estratégicos de la Universidad y que tengan mayor potencial de impacto en la sociedad.\n
 Promover la creación de alianzas estratégicas entre la UCV y el sector productivo, para favorecer la transferencia de tecnología y conocimiento desde la universidad hacia el sector productivo.\n
 Brindar apoyo técnico y administrativo a los equipos responsables de la ejecución de los proyectos universitarios.\n
 Facilitar la coordinación entre los diferentes actores involucrados en los proyectos universitarios.\n
 Monitorear y evaluar el avance de los proyectos universitarios, asegurando el cumplimiento de los objetivos y metas establecidos.\n
 Difusión de los resultados de los Proyectos Universitarios.\n
 Divulgar los resultados de los proyectos universitarios a través de diversos canales de comunicación.\n
 Participar en eventos y ferias relacionadas con la innovación y el desarrollo productivo para promocionar la oferta de la UCV.\n
 Organizar eventos para presentar los resultados de los proyectos universitarios a la comunidad universitaria y al público en general.\n
 Generar publicaciones científicas y técnicas sobre los resultados de los proyectos universitarios."
  },

  {
    name:"contacto",
    group: "programa3",
    subgroup: "contact",
    short_description:"",
    large_description: "Coordinador: RAFAEL VIELMA.\n
    Tlf: (0212) 605-3964.\n
    Correo: deu.depecp@gmail.com"
  },


  #DEPARTAMENTO1 RELACIONES INTERINSTITUCIONALES

  {
    name: "Departamento de Relaciones Interinstitucionales 🚀",
    group: "departamento1",
    subgroup: "description",
    short_description:"",
    large_description: "Como parte de la reorganización de las funciones y actividades, se reubica el Departamento de Eventos, Comunicación y Relaciones Institucionales como departamento de apoyo dada su naturaleza transversal prestando servicio a toda la Dirección. Así mismo cambia su nombre para identificarse apropiadamente con la dimensión e importancia de sus funciones.
    \n\nMISIÓN\nPromover la imagen institucional a nivel nacional mediante actividades educativas que impulsen la transformación social, utilizando medios comunicacionales y estrategias para la organización de eventos. Además, establecer y fortalecer relaciones interinstitucionales para ampliar el alcance de la universidad y generar sinergias que potencien sus proyectos de extensión.
    \n\nVISIÓN\nSer un departamento líder en la promoción de la extensión universitaria, reconocido por su capacidad de establecer alianzas estratégicas, fomentar la participación de la comunidad universitaria y organizar eventos que fortalezcan el vínculo entre la universidad y la sociedad."
  },
  {
    name: "Objetivos",
    group: "departamento1",
    subgroup: "objectives",
    short_description:"",
    large_description: " Gestionar el establecimiento de relaciones con organizaciones públicas, privadas, comunitarias y del tercer sector, dentro de los planes estratégicos de la Dirección.\n
      Gestionar la comunicación dirigida a divulgar las actividades de la Dirección dentro y fuera de la Universidad, dentro de los planes estratégicos de la Dirección.\n
      Planificar, organizar y realizar eventos que impulsen la función de los demás departamentos y dentro de los planes estratégicos de la Dirección."
  },
  {
    name: "Funciones",
    group: "departamento1", 
    subgroup: "functions",
    short_description:"",
    large_description: " Elaborar y coordinar planes y programas de comunicación internos y externos para proyectar la imagen de la Dirección de Extensión Universitaria.\n
     Divulgar a la comunidad mediante los medios de comunicación, videos, notas de prensa, entrevistas, entre otros; los aportes y resultados de la gestión académica, investigación y extensión de la Dirección de Extensión Universitaria, toda vez que se evalúa el impacto que produce el servicio.\n
    Diseñar, coordinar y ejecutar la política de comunicación institucional, previamente aprobada por el equipo directivo.\n
     Diseñar las actividades de logística y protocolo pertinentes a los eventos de extensión dentro y fuera de las instancias de la Universidad.\n
    Mantener comunicación periódica con las Dependencias y Facultades de la Universidad, para proyectar la Dirección de Extensión Universitaria.\n
    Realizar estudios de mercadeo que midan la factibilidad de comercializar los productos.\n• Asesorar y colaborar con el resto de las dependencias de la DEU en la preparación del material impreso para la divulgación de la gestión de extensión.\n
    Establecer alianzas estratégicas con las coordinaciones de extensión de las Facultades a fin de promover actividades educativas culturales en procura de satisfacer las necesidades de la comunidad.\n
    Fomentar la asociación con instituciones públicas y privadas a la realización de actividades educativas en beneficio de la comunidad.\n
    Elaborar una propuesta de protocolo para el establecimiento de acuerdos a nivel nacional e internacional.\n• Las demás funciones que le confieren las leyes y reglamentos, normas y su supervisor inmediato."
  },
  {
    name: "Contacto",
    group: "departamento1",
    subgroup: "contact",
    short_description:"",
    large_description: "Coordinador:  AGNEDY MATERANO.\n
    Tlf: (0212) 605-3908.\n
    Correo: deu.eventos.ucv.@gmail.com"
  },
  #DEPARTAMENTO2 EXTENSIÓN SOCIAL UNIVERSITARIA
  {
    name:"Departamento Extensión Social Universitaria 🚀",
    group: "departamento2",
    subgroup:"description",
    short_description:"",
    large_description: "La propuesta de cambio de nombre del Departamento de Proyectos de Extensión y Programas Estudiantiles, a Departamento de Extensión Social Universitaria, focaliza la función social de la extensión, ampliando la perspectiva de lo meramente asistencial hacia el bienestar social, el fortalecimiento del tejido social y la proyección de la Extensión Universitaria como función ejecutora entre los fondos de acción, inversión y desarrollo social.
   \n\nMISIÓN\nInfluir en el desarrollo integral de la ciudadanía universitaria y su entorno, mediante programas y proyectos de gestión social para el compromiso cívico, la equidad, y la responsabilidad social, promoviendo una universidad comprometida con el bienestar colectivo.
   \n\nVISIÓN\nInnovar en la promoción de la gestión social universitaria, construyendo puentes sólidos entre la universidad y la comunidad para un desarrollo sostenible, consolidando la presencia de la UCV a lo interno y externo."
  },
    {
    name: "Objetivos",
    group: "departamento2",
    subgroup: "objectives",
    short_description:"",
    large_description: "Facilitar el acceso a formaciones no académicas dirigidas a la actualización y el mejoramiento profesional de toda la comunidad universitaria.\n
    Mantener una oferta educativa y accesible a un público amplio que denota el compromiso social de la Universidad por la sociedad."
    },
  {
    name: "Funciones",
    group: "departamento2", 
    subgroup: "functions",
    short_description:"",
    large_description:"Diseñar, elaborar y coordinar programas y proyectos que tengan que ver con la proyección extensionista universitaria.\n
 Desarrollar un sistema de información para el registro, monitoreo y seguimiento de proyectos y programas de extensión universitaria a nivel nacional.\n
 Conceptuar y proponer nuevos productos o servicios que posibiliten la generación de recursos propios, a través de planes de funcionamiento como patrocinantes, convenios marco y específicos entre instituciones públicas y privadas.\n
 Participar en el desarrollo de la visión estratégica de la Dirección de Extensión Universitaria, a través de planes estratégicos que permitan demostrar la factibilidad de la permanencia y sustentabilidad de los productos ofertados.\n
 Controlar y evaluar los proyectos y programas que se realicen a través de convenios.\n
 Cooperar en la oferta de programas de inducción a estudiantes y profesores como actividad preparatoria al inicio de las prácticas comunitarias.\n
 Identificar las necesidades más apremiantes en las comunidades, con la finalidad de disponer de una base de datos de problemas comunitarios, la que junto a las que dispongan las Escuelas y Facultades de la UCV, pueden ser considerados como insumos para determinar acciones conjuntas.\n
 Diseñar propuestas para la firma de Rector(a), convenios para la presentación del servicio comunitario, con los Consejos Locales de Planificación Pública, Consejos Estadales de Planificación y Coordinación de Políticas Públicas, instituciones y organizaciones públicas o privadas y comunidad organizada, entre otras.\n
 Evaluar los proyectos presentados por los sectores con iniciativa, a objeto de ser considerada su aprobación.\n
 Garantizar mecanismos de información para las distintas comunidades, sobre las áreas que competen a la Universidad Central de Venezuela relativas al Servicio Comunitario.\n
 Las demás funciones que le confiere las leyes y reglamentos, normas y su supervisor inmediato."
  },
  {
    name: "Contacto",
    group: "departamento2",
    subgroup: "contact",
    short_description:"",
    large_description:"Coordinador: MAYERKIS HIDALGO.\n
    Tlf: (0412) 5502096.\n
    Correo: deu.depgsu@gmail.com"
  },
  #DEPARTAMENTO3 EDUCACIÓN CONTINUA Y PERMANENTE
  {
    name: "Departamento de Educación Continua y Permanente 🚀",
    group: "departamento3",
    subgroup: "description",
    short_description:"",
    large_description:"El Departamento de Educación Continua y Permanente (ECP) es el responsable de la mayor fuente de ingresos por concepto de avales y cursos, talleres, programas y diplomados no acreditables ni conducentes a título. Es el departamento que abre puertas a la actualización continua de profesionales, la comunitaria y entre otras.
    \n\nMISIÓN\nOfrecer programas innovadores y relevantes que satisfagan las necesidades cambiantes de los profesionales y la comunidad, fomentando el crecimiento personal y el avance profesional.
    \n\nVISIÓN\nTransformar vidas a través de oportunidades educativas accesibles, actualizadas y alineadas con las tendencias del mercado laboral y los avances tecnológicos, y apalancando el fortalecimiento institucional."
  },
  {
    name: "Objetivos",
    group: "departamento3",
    subgroup: "objectives",
    short_description:"",
    large_description:"Facilitar el acceso a formaciones no académicas dirigidas a la actualización y el mejoramiento profesional de toda la comunidad universitaria.\n
     Mantener una oferta educativa y accesible a un público amplio que denota el compromiso social de la Universidad por la sociedad."
  },
  {
    name: "Funciones",
    group: "departamento3", 
    subgroup: "functions",
    short_description:"",
    large_description:"Formular y evaluar la factibilidad de realizar programas y proyectos de orientación educativa.\n
 Asegurar el cumplimiento de los lineamientos metodológicos requeridos.\n
 Realizar informes de avance de los programas y proyectos de extensión educativa.\n
 Brindar información de los programas y proyectos de extensión educativa.\n
 Participar en la organización de cursos y talleres, así como en la coordinación de estos con las Facultades y Dependencias Centrales de la Universidad que lo requieran.\n
 Elaborar la planificación de cursos de capacitación, presenciales o a distancia a ser dictados por la Dirección de Extensión.\n
 Coordinar la divulgación de todos los programas educativos de extensión de la Universidad.\n
 Las demás funciones que le confieren las leyes y reglamentos, normas y su supervisor inmediato."
  },
  {  
    name: "Contacto",
    group: "departamento3",
    subgroup: "contact",
    short_description:"",
    large_description:"Coordinador: MARIA ISABEL RAMOS.\n
    Tlf: (0212) 605-3919.\n
    Correo: deu.depecp@gmail.com"
},
#DEPARTAMENTO4 DIVISIÓN DE PROYECTOS Y PROGRAMAS
{
  name: "Divisíon de Proyectos y Programas 🚀",
  group: "departamento4",
  subgroup: "description",
  short_description:"",
  large_description:"La División de Proyectos y Programas coordina los Programas Regionales y los Proyectos Universitarios, fortaleciendo la vinculación de la UCV con la sociedad. A través de la planificación y ejecución estratégica, impulsa la innovación, el emprendimiento y la transferencia de conocimiento, ampliando el impacto de la universidad en el desarrollo local y regional.
  \n\nMISIÓN\nCoordinar y gestionar programas y proyectos universitarios que fortalezcan la vinculación de la UCV con la sociedad, promoviendo la innovación, el emprendimiento y la transferencia de conocimiento. A través de alianzas estratégicas, buscamos ampliar el impacto de la universidad en el desarrollo local y regional.
  \n\nVISIÓN\nSer un referente en la extensión universitaria, consolidando un modelo de gestión innovador que fomente la investigación aplicada, la cooperación con sectores productivos y el desarrollo sostenible de las comunidades, ampliando el alcance y la proyección social de la UCV."
},
{
  name: "Objetivos",
  group: "departamento4",
  subgroup: "objectives",
  short_description:"",
  large_description:"Planificación, diseño, ejecución y evaluación de programas y proyectos de extensión universitaria en las localidades y regiones del país.\n
 Promover el establecimiento de alianzas estratégicas con actores públicos, privados y sociales para la ejecución de programas y proyectos."
},
{
  name: "Funciones",
  group: "departamento4", 
  subgroup: "functions",
  short_description:"",
  large_description:"Formular y evaluar la factibilidad de realizar programas y proyectos de orientación educativa.\n
 Asegurar el cumplimiento de los lineamientos metodológicos requeridos.\n
 Realizar informes de avance de los programas y proyectos de extensión educativa.\n
 Brindar información de los programas y proyectos de extensión educativa.\n
 Participar en la organización de cursos y talleres, así como en la coordinación de estos con las Facultades y Dependencias Centrales de la Universidad que lo requieran.\n
 Elaborar la planificación de cursos de capacitación, presenciales o a distancia a ser dictados por la Dirección de Extensión.\n
 Coordinar la divulgación de todos los programas educativos de extensión de la Universidad.
 Las demás funciones que le confieren las leyes y reglamentos, normas y su supervisor inmediato."
},
{
  name: "Contacto",
  group: "departamento4",
  subgroup: "contact",
  short_description:"",
  large_description:"Coordinador: ELIZABETH PIÑA.\n
 Tlf: (0212) 605-4397.\n
 Correo: deu.divpp@gmail.com"
},
#GRUPOS DE EXTENSIÓN DE LA DEU
{
  name: "Grupo de Extensión DEU",
  group: "grupos_extension",
  subgroup: "description",
  short_description:"",
  large_description:"TEXTO GENERICO: La División de Proyectos y Programas coordina los Programas Regionales y los Proyectos Universitarios, fortaleciendo la vinculación de la UCV con la sociedad. A través de la planificación y ejecución estratégica, impulsa la innovación, el emprendimiento y la transferencia de conocimiento, ampliando el impacto de la universidad en el desarrollo local y regional.
  \n\nMISIÓN\nCoordinar y gestionar programas y proyectos universitarios que fortalezcan la vinculación de la UCV con la sociedad, promoviendo la innovación, el emprendimiento y la transferencia de conocimiento. A través de alianzas estratégicas, buscamos ampliar el impacto de la universidad en el desarrollo local y regional.
  \n\nVISIÓN\nSer un referente en la extensión universitaria, consolidando un modelo de gestión innovador que fomente la investigación aplicada, la cooperación con sectores productivos y el desarrollo sostenible de las comunidades, ampliando el alcance y la proyección social de la UCV."
},
{
  name: "Objetivos",
  group: "grupos_extension",
  subgroup: "objectives",
  short_description:"",
  large_description:"Planificación, diseño, ejecución y evaluación de programas y proyectos de extensión universitaria en las localidades y regiones del país.\n
 Promover el establecimiento de alianzas estratégicas con actores públicos, privados y sociales para la ejecución de programas y proyectos."
},
{
  name: "Funciones",
  group: "grupos_extension", 
  subgroup: "functions",
  short_description:"",
  large_description:"Formular y evaluar la factibilidad de realizar programas y proyectos de orientación educativa.\n
 Asegurar el cumplimiento de los lineamientos metodológicos requeridos.\n
 Realizar informes de avance de los programas y proyectos de extensión educativa.\n
 Brindar información de los programas y proyectos de extensión educativa.\n
 Participar en la organización de cursos y talleres, así como en la coordinación de estos con las Facultades y Dependencias Centrales de la Universidad que lo requieran.\n
 Elaborar la planificación de cursos de capacitación, presenciales o a distancia a ser dictados por la Dirección de Extensión.\n
 Coordinar la divulgación de todos los programas educativos de extensión de la Universidad.
 Las demás funciones que le confieren las leyes y reglamentos, normas y su supervisor inmediato."
},
{
  name: "Contacto",
  group: "grupos_extension",
  subgroup: "contact",
  short_description:"",
  large_description:"Coordinador: ELIZABETH PIÑA.\n
 Tlf: (0212) 605-4397.\n
 Correo: deu.divpp@gmail.com"
},
#ESPACIOS UNIVERSITARIOS
{
  name: "Espacios Universitarios",
  group: "espacios_universitarios",
  subgroup: "description",
  short_description:"",
  large_description:"TEXTO GENERICO_ ESPACIOS: La División de Proyectos y Programas coordina los Programas Regionales y los Proyectos Universitarios, fortaleciendo la vinculación de la UCV con la sociedad. A través de la planificación y ejecución estratégica, impulsa la innovación, el emprendimiento y la transferencia de conocimiento, ampliando el impacto de la universidad en el desarrollo local y regional.
  \n\nMISIÓN\nCoordinar y gestionar programas y proyectos universitarios que fortalezcan la vinculación de la UCV con la sociedad, promoviendo la innovación, el emprendimiento y la transferencia de conocimiento. A través de alianzas estratégicas, buscamos ampliar el impacto de la universidad en el desarrollo local y regional.
  \n\nVISIÓN\nSer un referente en la extensión universitaria, consolidando un modelo de gestión innovador que fomente la investigación aplicada, la cooperación con sectores productivos y el desarrollo sostenible de las comunidades, ampliando el alcance y la proyección social de la UCV."
},
{
  name: "Objetivos",
  group: "espacios_universitarios",
  subgroup: "objectives",
  short_description:"",
  large_description:"Planificación, diseño, ejecución y evaluación de programas y proyectos de extensión universitaria en las localidades y regiones del país.\n
 Promover el establecimiento de alianzas estratégicas con actores públicos, privados y sociales para la ejecución de programas y proyectos."
},
{
  name: "Funciones",
  group: "espacios_universitarios", 
  subgroup: "functions",
  short_description:"",
  large_description:"Formular y evaluar la factibilidad de realizar programas y proyectos de orientación educativa.\n
 Asegurar el cumplimiento de los lineamientos metodológicos requeridos.\n
 Realizar informes de avance de los programas y proyectos de extensión educativa.\n
 Brindar información de los programas y proyectos de extensión educativa.\n
 Participar en la organización de cursos y talleres, así como en la coordinación de estos con las Facultades y Dependencias Centrales de la Universidad que lo requieran.\n
 Elaborar la planificación de cursos de capacitación, presenciales o a distancia a ser dictados por la Dirección de Extensión.\n
 Coordinar la divulgación de todos los programas educativos de extensión de la Universidad.
 Las demás funciones que le confieren las leyes y reglamentos, normas y su supervisor inmediato."
},
{
  name: "Contacto",
  group: "espacios_universitarios",
  subgroup: "contact",
  short_description:"",
  large_description:"Coordinador: ELIZABETH PIÑA.\n
 Tlf: (0212) 605-4397.\n
 Correo: deu.divpp@gmail.com"
},
#CERTIFICACIONES Y AVALES
{
  name: "Certificaciones y Avales",
  group: "certificaciones",
  subgroup: "description",
  short_description:"",
  large_description:"TEXTO GENERICO_ CERTIFICADOS: La División de Proyectos y Programas coordina los Programas Regionales y los Proyectos Universitarios, fortaleciendo la vinculación de la UCV con la sociedad. A través de la planificación y ejecución estratégica, impulsa la innovación, el emprendimiento y la transferencia de conocimiento, ampliando el impacto de la universidad en el desarrollo local y regional.
  \n\nMISIÓN\nCoordinar y gestionar programas y proyectos universitarios que fortalezcan la vinculación de la UCV con la sociedad, promoviendo la innovación, el emprendimiento y la transferencia de conocimiento. A través de alianzas estratégicas, buscamos ampliar el impacto de la universidad en el desarrollo local y regional.
  \n\nVISIÓN\nSer un referente en la extensión universitaria, consolidando un modelo de gestión innovador que fomente la investigación aplicada, la cooperación con sectores productivos y el desarrollo sostenible de las comunidades, ampliando el alcance y la proyección social de la UCV."
},
{
  name: "Objetivos",
  group: "certificaciones",
  subgroup: "objectives",
  short_description:"",
  large_description:"Planificación, diseño, ejecución y evaluación de programas y proyectos de extensión universitaria en las localidades y regiones del país.\n
 Promover el establecimiento de alianzas estratégicas con actores públicos, privados y sociales para la ejecución de programas y proyectos."
},
{
  name: "Funciones",
  group: "certificaciones", 
  subgroup: "functions",
  short_description:"",
  large_description:"Formular y evaluar la factibilidad de realizar programas y proyectos de orientación educativa.\n
 Asegurar el cumplimiento de los lineamientos metodológicos requeridos.\n
 Realizar informes de avance de los programas y proyectos de extensión educativa.\n
 Brindar información de los programas y proyectos de extensión educativa.\n
 Participar en la organización de cursos y talleres, así como en la coordinación de estos con las Facultades y Dependencias Centrales de la Universidad que lo requieran.\n
 Elaborar la planificación de cursos de capacitación, presenciales o a distancia a ser dictados por la Dirección de Extensión.\n
 Coordinar la divulgación de todos los programas educativos de extensión de la Universidad.
 Las demás funciones que le confieren las leyes y reglamentos, normas y su supervisor inmediato."
},
{
  name: "Contacto",
  group: "certificaciones",
  subgroup: "contact",
  short_description:"",
  large_description:"Coordinador: ELIZABETH PIÑA.\n
 Tlf: (0212) 605-4397.\n
 Correo: deu.divpp@gmail.com"
}
]

# Usar find_or_create_by para mantener IDs si existen
required_pages.each do |page_attrs|
  page = Page.find_or_initialize_by(
    group: page_attrs[:group],
    subgroup: page_attrs[:subgroup]
  )
  
  page.name = page_attrs[:name]
  page.short_description = page_attrs[:short_description]
  page.large_description = page_attrs[:large_description]
  
  if page.save
    puts "✓ Página '#{page_attrs[:name]}' #{page.new_record? ? 'creada' : 'actualizada'} (ID: #{page.id})"
  else
    puts "✗ Error página '#{page_attrs[:name]}': #{page.errors.full_messages.join(', ')}"
  end
end