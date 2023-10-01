with Ada.Text_Io;           use Ada.Text_Io;
with Ada.Integer_Text_Io;   use Ada.Integer_Text_Io;
with Jeu_Devin_Exo1;
with Jeu_Devin_Exo2;

-- Auteur : Evann DREUMONT
--
-- Jouer au jeu du devin
procedure Jeu_Devin_Exo3 is
  Action  : Integer; -- Entier correspondant au mode de jeux choisit
  Quitter : Boolean; -- Booléen déterminant si la boucle principale doit etre continuer ou non permettant la fin de l'execution du programme.
begin
  -- Initialiser la variable quitter
  Quitter := False;
  loop
    -- Demander l'action voulut par l'utilisateur
    Put_Line("1- L'ordinateur choisit un nombre et vous le devinez");
    Put_Line("2- Vous choisissez un nombre et l'ordinateur le deviner");
    Put_Line("0- Quitter le programme");
    Put("Votre choix : ");
    Get(Action);
    New_Line;

    -- Effectuer l'acion sélectionnée par l'utilisateur
    case Action is 
      when 1 => -- Faire deviner un nombre a l'utilisateur
        Jeu_Devin_Exo1;
        New_Line;
      when 2 => -- Faire deviner un nombre à l'ordinateur
        Jeu_Devin_Exo2;
        New_Line;
      when 0 => -- afficher le message de fin et quitter
        Quitter := True;
        Put_Line("Au revoir");
      When others => -- Afficher un message d'erreur
        Put_Line("Choix incorrect.");
        New_Line;
    end case;
    exit when Quitter;
  end loop;
end Jeu_Devin_Exo3;
