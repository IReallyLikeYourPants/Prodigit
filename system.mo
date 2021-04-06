block System

Studente stud;
Aula aula;
Gomp gomp;
Prodigit prodigit;
Monitor monitor;
Monitor2 monitor2;

equation

connect(prodigit.pre_in, stud.pre_in);
connect(prodigit.pre_out, stud.pre_out);

connect(prodigit.aulaAgibile, gomp.aulaAgibile);
connect(prodigit.gompDown, gomp.gompDown);
connect(prodigit.prenotatiIn, gomp.prenotatiOut);

connect(gomp.nuoviPrenotati, prodigit.prenotatiOut);
connect(gomp.statoAula, aula.statoAula);

connect(monitor.prenotati, gomp.prenotatiOut);
connect(monitor2.prenotatiProdigit, prodigit.prenotatiOut);
connect(monitor2.prenotatiGomp, gomp.prenotatiOut);

end System;
