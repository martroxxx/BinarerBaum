unit uBST;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type TElement = real;

type TTreeNode = class
  public
    value : TElement;
    leftChild : TTreeNode;
    rightChild : TTreeNode;
  end;
type TTree = class
  public
    node : TTreeNode;
    Zeiger: TElement;
    constructor create;
    function search (element:TElement):TTreeNode;
    procedure insert (element:TElement);
    procedure delete (element:TElement);
    function isEmpty:boolean;
    //function minNode(currentNode:TTreeNode):TTreeNode;
    function maxNode:TTreeNode;
    procedure print(image:TImage);
    procedure vor;
    procedure zurueck;
   end;

implementation

constructor TTree.create;
begin
  node := nil;
end;

function TTree.maxNode:TTreeNode;
procedure maxNodeRecursive (var currentNode:TTreeNode);
begin
  if (currentNode = nil) then
  begin
     maxNode := currentNode
  end
  else if (currentNode.rightChild <> nil) then maxNodeRecursive (currentNode.rightChild)
  else if (currentNode.rightChild = nil) then maxNode := currentNode;
end;

begin
  maxNodeRecursive (node);
end;

procedure TTree.vor;
begin

end;
procedure TTree.zurueck;
begin

end;

function TTree.search (element:TElement):TTreeNode;
procedure searchRecursive (var currentNode:TTreeNode);
begin
  if (currentNode = nil) then search := NIL
  else if (currentNode.value = element) then search := currentNode
  else
  begin
    if (currentNode.value < element) then searchRecursive (currentNode.rightChild);
    if (currentNode.value > element) then searchRecursive (currentNode.leftChild);
  end;
end;

begin
  searchRecursive (node);
end;

procedure TTree.insert (element:TElement);
procedure insertRecursive (var currentNode:TTreeNode);
begin
  if (currentNode = nil) then
  begin
     currentNode := TTreeNode.create;
     currentNode.value := element;
     currentNode.leftChild := nil;
     currentNode.rightChild := nil;
     Zeiger:=currentNode.value;
  end
  else
  begin
    if (currentNode.value < element) then insertRecursive (currentNode.rightChild)
    else if (currentNode.value > element) then insertRecursive (currentNode.leftChild);
  end;
end;

begin
  insertRecursive (node);
end;

procedure TTree.delete (element:TElement);

function minNode(currentNode:TTreeNode):TTreeNode;
procedure minNodeRecursive(var currentNode:TTreeNode);
begin
  if (currentNode = nil) then
  begin
     minNode := currentNode
  end
  else if (currentNode.leftChild <> nil) then minNodeRecursive (currentNode.leftChild)
  else if (currentNode.leftChild = nil) then minNode := currentNode;
end;

begin
  minNodeRecursive (currentNode);
end;

procedure deleteRecursive (var currentNode:TTreeNode);
begin
  if (currentNode.value = element) then
  begin
    if (currentNode.rightChild <> nil) then
    begin
      currentNode.value := minNode(currentNode.rightChild).value;
      currentNode.rightChild := currentNode.rightChild.rightChild
    end
    else currentNode := nil
  end
  else if (currentNode.value < element) then deleteRecursive (currentNode.rightChild)
  else if (currentNode.value > element) then deleteRecursive (currentNode.leftChild);
end;

begin
  deleteRecursive (node);
end;

function TTree.isEmpty:boolean;
begin
  if (node = nil) then isEmpty := true
  else isEmpty := false;
end;

procedure TTree.print(image:TImage);
   procedure printRecursive (b:TTreeNode; posx, dx, posy:Integer);
   begin
      IF b <> nil then
      BEGIn
         image.Canvas.TextOut(posx,posy,FloatToStr(b.value));
         image.Canvas.MoveTo(posx,posy+12);
         image.Canvas.LineTo(posx-dx,posy+40);
         image.Canvas.MoveTo (posx,posy+12);
         image.Canvas.LineTo (posx+dx,posy+40);
         printRecursive(b.leftChild, posx-dx,dx div 2, posy+40);
         printRecursive (b.rightChild, posx+dx, dx div 2, posy+40)
      end;
   end;
begin
      image.canvas.Rectangle(0,0,image.Width,image.Height);
      printRecursive (node, image.width div 2, image.width div 4, 5);
end;
end.

