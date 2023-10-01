import("..\1983-Moskva-Tallinn.avs")

v100 = LSMASHVideoSource(dst_dir + "v100rc.mp4")

v100 = v100.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v100 = v100.convertToYV12(interlaced=false)

v100 = v100.deScratch
v100 = v100.removeDirt

v100 = v100.UnsharpMask(strength=500, radius=5, threshold=1)
v100 = v100.adjustBorders

va = BlankClip(v100, audio_rate = 48000, channels = 2).killVideo
v100 = v100.audioDub(va)

return v100.Prefetch

