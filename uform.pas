unit uForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, uBST, math;

type

  { TbinarySearchTreeForm }

  TbinarySearchTreeForm = class(TForm)
    binarySearchTree: TImage;
    minNode: TButton;
    maxNode: TButton;
    deleteElement: TButton;
    insertElement: TButton;
    search: TButton;
    Output: TEdit;
    Input: TEdit;
    binarySearchTreeForm: TImage;
    procedure deleteElementClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InputKeyPress(Sender: TObject; var Key: char);
    procedure insertElementClick(Sender: TObject);
    procedure maxNodeClick(Sender: TObject);
    procedure minNodeClick(Sender: TObject);
    procedure searchClick(Sender: TObject);
  private
    procedure printTree;
  public

  end;

var
  binarySearchTreeForm: TbinarySearchTreeForm;
  tree:TTree;
implementation

{$R *.lfm}

{ TbinarySearchTreeForm }

procedure TbinarySearchTreeForm.insertElementClick(Sender: TObject);   // only numbers
begin
  if (input.caption = '') then tree.insert(randomRange(1, 50))
  else tree.insert(StrToFloat(input.caption));

  printTree;
end;

procedure TbinarySearchTreeForm.maxNodeClick(Sender: TObject);
begin
  output.caption := floatToStr(tree.maxNode.value);
end;

procedure TbinarySearchTreeForm.minNodeClick(Sender: TObject);
begin
  //output.caption := floatToStr(tree.minNode(node).value);
end;

procedure TbinarySearchTreeForm.searchClick(Sender: TObject);
begin
  //output.caption:=BoolToStr(tree.search(StrToFloat(input.caption)));
end;

procedure TbinarySearchTreeForm.FormCreate(Sender: TObject);
begin
  tree := TTree.create;
end;

procedure TbinarySearchTreeForm.InputKeyPress(Sender: TObject; var Key: char);
begin
  if (key = #13) then tree.insert(StrToFloat(input.caption));
  printTree;
end;

procedure TbinarySearchTreeForm.deleteElementClick(Sender: TObject);
begin
  if (tree.isEmpty = true) then showMessage ('the Tree is empty! How can i delete something?!?!?!')
  else tree.delete(strToFloat(input.caption));

  printTree;
end;

procedure  TbinarySearchTreeForm.printTree;
begin
  tree.print(binarySearchTree);
end;

end.

