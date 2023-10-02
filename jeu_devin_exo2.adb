with Ada.Text_Io;          use Ada.Text_Io;
-- with Ada.Integer_Text_Io;  use Ada.Integer_Text_Io;

-- Auteur : Antoine REY
-- Faire deviner un nombre choisi par un utilisateur à l’ordinateur
procedure Jeu_Devin_Exo2 is
	Reponse     : Character;    -- Reponse de l'utilisateur aux questions du programme
	Compteur    : Integer;      -- Compte le nombre d'essais du programme
	Quitter     : Boolean;	    -- Etat du jeu 
	Min         : Integer;		  -- Valeur minimale de l'intervalle dans lequel est la reponse de l'utilisateur
	Max         : Integer;		  -- Valeur maximale de l'intervalle dans lequel est la reponse de l'utilisateur
	Proposition : Integer;      -- Proposition du programme visant a deviner le nombre de l'utilisateur
begin
	-- Demander de choisir un entier entre 1 et 999
	loop 
		Put("Avez-vous choisi un nombre compris entre 1 et 999 (o/n) ?");
		Get(Reponse);
		if Reponse /= 'O' and Reponse /= 'o' then
			Put_Line("J'attend...");
		end if;
		exit when Reponse = 'o' or Reponse = 'O';
	end loop;  
	-- Deviner le nombre choisi par l'utilisateur
	-- initialiser les variables
	Min := 1;
	Max := 999;
	Proposition := (Min + Max)/2;
	Compteur := 1;
	Quitter := False;
	loop
		-- Afficher le menu de contrôle
		Put("Proposition"& Integer'Image(Compteur)& " : "& Integer'Image(Proposition));
		New_Line;
		Put_Line("Trop (g)rand, trop (p)etit ou (t)rouvé ?");
		-- Demander à l'utilisateur une suggestion
		Get(Reponse);
		-- Traiter la réponse de l’utilisateur
		case Reponse is
			when 'G' | 'g' => Max := Proposition-1;
				Proposition := (Min + Max)/2;
				Compteur := Compteur + 1;
			when 'P' | 'p' => Min := Proposition+1;
				Proposition := (Min + Max)/2;
				Compteur := Compteur + 1;
			when 'T' | 't' => Quitter := True;
			when others => 
				-- Redemander une reponse a l'utilisateur
				Put_Line("Je n'ai pas compris. Merci de répondre :");				
				Put_Line("   g si ma proposition est trop grande");
				Put_Line("   p si ma proposition est trop petite");
				Put_Line("   t si j'ai trouvé le nombre");
		end case;
		-- Detecter le cas de triche 
		if Min>Max then
			Put_Line("Vous trichez. J’arrête cette partie.");
			Quitter := True;
		end if;
		exit when Quitter;
	end loop;
	-- Afficher le message de resultat
	if Reponse = 'T' or Reponse = 't' then
		Put("J'ai trouve" & Integer'Image(Proposition) & " en " & Integer'Image(Compteur));
		if Compteur = 1 then
			Put_Line(" essai.");
		else
			Put_line(" essais.");
		end if;
	end if;
end Jeu_Devin_Exo2;
