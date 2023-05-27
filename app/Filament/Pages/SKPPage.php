<?php

namespace App\Filament\Pages;

use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\FileUpload;
use Filament\Pages\Page;
use App\Models\User;
use App\Models\SKP;

class SKPPage extends Page
{
    protected static ?string $slug = 'daftar-skp';
    protected static ?string $navigationLabel = 'SKP';
    protected ?string $heading = 'SKP';
    protected ?string $subheading = 'Sasaran Kinerja Pegawai';
    protected static ?int $navigationSort = 2;
    protected static ?string $navigationIcon = 'heroicon-o-document-text';
    protected static ?string $navigationGroup = 'Main Menu';
    protected static string $view = 'filament.pages.s-k-p';

    public $skp;

    public function mount()
    {
        $this->skp = [];
        $this->form->fill(['nama' => auth()->user()->name]);
    }

    protected function getFormSchema(): array
    {
        return [
            Grid::make()
                ->schema([
                    Select::make('penilai')
                        ->label('Pilih Atasan yang Telah Diintervensi')
                        ->options(SKP::where('pegawai_id', auth()->id())->distinct('penilai_id')->join('users', 'skp.penilai_id', '=', 'users.id')->pluck('users.name', 'users.id'))
                        ->searchable()
                        ->required(),
                ]),
        ];
    }

    public function submit()
    {
        $data = $this->form->getState();
        $this->skp = SKP::where('penilai_id', $data['penilai'])->get();
    }
}
