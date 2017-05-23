program ALGOTP1_FICHIERS_FB1_Wehrling_Axel;

uses crt, sysutils;

const
        VerbeInfi='rire recevoir aller bouillir envoyer peindre habiter payer mourrir hair vouloir finir amuser ';
		VerbeGroupe2='finis hais ';
		VerbeIssant='finissant haissant ';

var
        FichInfini,FichIssant : TextFile;

//BUT: Procedure qui crée un fichier text avec des verbes à l'infinitif.
//ENTREE: Fichier Text.
//SORTIE: Fichier Text avec une liste de verbe.
		
		
procedure CreaFichierInfinitif(var FichInfini:Textfile);

var
		//Compteur est la variable qui va garder la possition de la lettre juste après le dernier espace.
        i,compteur : integer;
		//verifchar est la variable intermédiaire qui va servir au test pour savoir si le Caractère est un 'espace'.
        verifchar:string;
		//Variable qui récupére le verbe.
		verbe:string;


begin
        Assign(FichInfini,'FichierVerbeInfini.txt');
        rewrite(FichInfini);
		compteur:=1;
        for i:=1 to length(VerbeInfi) do
        begin
            verifchar:=copy(VerbeInfi,i,1);
            if  (verifchar=' ') then
            begin
				//i est la position de l'espace, donc (i-compteur)=longueur du verbe.
				//compteur quant à lui est la première lettre
				verbe:=copy(VerbeInfi,compteur,i-compteur);
				writeln(FichInfini,verbe);
				//met le compteur sur la position de la première lettre du prochain verbe.
				compteur:=i+1;
			end;
        end;
		close(FichInfini);
end;


//BUT: Procedure qui crée un fichier text avec des verbes du 2 ème groupe au participe passé.
//ENTREE: Fichier Text.
//SORTIE: Fichier Text avec une liste de verbe.

procedure CreaFichierIssant(var FichIssant:Textfile);
var
        i,compteur : integer;
        verifchar:string;
		verbe:string;

begin
	Assign(FichIssant,'FichierVerbeIssant.txt');
	rewrite(FichIssant);
	compteur:=1;
        for i:=1 to length(VerbeIssant) do
        begin
            verifchar:=copy(VerbeIssant,i,1);
            if  (verifchar=' ') then
            begin
				verbe:=copy(VerbeIssant,compteur,i-compteur);
				writeln(FichIssant,verbe);
				compteur:=i+1;
			end;
        end;
		close(FichIssant);
	
end;

//BUT: Fonction qui vérifie si le mot existe dans la liste de verbe à l'infinitif.
//ENTREE: Une chaine de caractère.
//SORTIE: Booleen.


function VerifVerbe () : boolean;

var
	//Variable qui va être comparée au mot entré par l'utilisateur.
	verif, VerbeEntr : string;
	//Booleen qui va prendre la valeur 'true' si le verbe entré est dans la liste de verbe.
	Test, TestSave : boolean;

begin
	repeat
		begin
			writeln('Veuillez entrer un verbe à l''infinitif.');
			readln(VerbeEntr);
			VerbeEntr:=lowercase(VerbeEntr);
			reset(FichInfini);
			Test:=false;
			TestSave:=false;
			While not (Eof(FichInfini)) do
				begin
					readln(FichInfini,verif);
					if (VerbeEntr=verif) then
						Test:=true
					else
						Test:=false;
					if (Test=true) then	
						TestSave:=true
						
				end;
			if (TestSave=false) then
				writeln('Ce verbe n''existe pas/n''est pas dans la liste!');
		end;
	until (TestSave=true) ;
	
	VerifVerbe:=Test;
	
end;

BEGIN
        clrscr;
		CreaFichierInfinitif(FichInfini);
		CreaFichierIssant(FichIssant);
		VerifVerbe();
        readln;

END.

