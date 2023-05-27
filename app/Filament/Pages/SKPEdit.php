<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\SKP;
use App\Models\SKPDetail;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Select;
use Spatie\Permission\Models\Role;
use Livewire\TemporaryUploadedFile;
use Closure;

class SKPEdit extends Page
{
    protected static ?string $navigationIcon = 'heroicon-o-document-text';
    protected static ?string $slug = 'edit-skp/{record?}';
    protected ?string $heading = 'SKP';
    protected ?string $subheading = 'Sasaran Kinerja Pegawai';
    protected static string $view = 'filament.pages.skp-edit';

    public $record;

    public function mount($record)
    {
        $this->record = $record;
        $skp = SKP::whereId($record)->first();
        $data = SKPDetail::where('skp_id', $skp->id)->first();
        $this->form->fill($data ? $data->toArray() : []);
    }

    protected function getFormSchema(): array
    {
        if (auth()->user()->hasRole('penilai')) {
            return [
                Card::make()->columns(2)->schema([
                    TextInput::make('feedback')
                        ->required(),
                    Select::make('nilai')
                        ->options([
                            'Diatas Ekspetasi',
                            'Sesuai Ekspetasi',
                            'Dibawah Ekspetasi',
                        ])
                        ->required(),
                    TextInput::make('nilai_angka')
                        ->required(),
                ]),
            ];
        } else {
            return [
                Card::make()->columns(2)->schema([
                    TextInput::make('realisasi')
                        ->required(),
                    FileUpload::make('lampiran')
                        ->directory('lampiran')
                        ->getUploadedFileNameForStorageUsing(function (TemporaryUploadedFile $file): string {
                            return (string) str($file->getClientOriginalName())->prepend(auth()->id().'-'.date("Y-m-d").'-');
                        })
                ]),
            ];
        }

    }

    public function submit()
    {
        $data = $this->form->getState();
        $skp = SKP::whereId($this->record)->first();
        if (auth()->user()->hasRole('penilai')) {
            $detail = SKPDetail::where('skp_id', $skp->id)->first();
            if (!$detail) {
                SKPDetail::create([
                    'skp_id' => $skp->id,
                    'feedback' => $data['feedback'],
                    'nilai' => $data['nilai'],
                    'nilai_angka' => $data['nilai_angka']
                ]);
            } else {
                $detail->update($data);
            }
        } else {
            $skp->update($this->form->getState());
        }
        $this->notify('success', 'Berhasil menyimpan.');
    }
}
