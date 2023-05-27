<?php

namespace App\Filament\Resources;

use App\Filament\Resources\SKPResource\Pages;
use App\Filament\Resources\SKPResource\RelationManagers;
use App\Models\SKP;
use App\Models\User;
use Filament\Forms;
use Filament\Resources\Form;
use Filament\Resources\Resource;
use Filament\Resources\Table;
use Filament\Tables;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Spatie\Permission\Models\Role;
use Filament\Tables\Columns\TextColumn;

class SKPResource extends Resource
{
    protected static ?string $model = SKP::class;
    protected static ?string $label = 'SKP';
    protected static ?string $slug = 'data-skp';
    protected static ?string $navigationIcon = 'heroicon-o-bookmark';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Card::make()->columns(2)->schema([
                    TextInput::make('nama')
                        ->required(),
                    TextInput::make('detail')
                        ->required(),
                    Select::make('pegawai_id')
                        ->label('Pegawai')
                        ->relationship('pegawai', 'name')
                        ->options(Role::where('name', 'pegawai')->first()->users->pluck('name', 'id'))
                        ->preload()
                        ->required()
                        ->searchable(),
                    Select::make('penilai_id')
                        ->label('Pejabat Penilai')
                        ->relationship('penilai', 'name')
                        ->options(Role::where('name', 'penilai')->first()->users->pluck('name', 'id'))
                        ->preload()
                        ->required()
                        ->searchable(),
                    TextInput::make('periode')
                        ->required()
                        ->maxLength(255),
                ]),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('nama')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('detail')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('pegawai.name')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('penilai.name')
                    ->searchable()
                    ->sortable(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListSKPS::route('/'),
            'create' => Pages\CreateSKP::route('/create'),
            'edit' => Pages\EditSKP::route('/{record}/edit'),
        ];
    }
}
